# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  confirmation_sent_at   :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  first_name             :string
#  last_name              :string
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  sign_in_count          :integer          default(0), not null
#  unconfirmed_email      :string
#  user_type              :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  PASSWORD_FORMAT = /\A
  (?=.{10,})          # Must contain 10 or more characters
  (?=.*\d)           # Must contain a digit
  (?=.*[a-z])        # Must contain a lower case character
  (?=.*[A-Z])        # Must contain an upper case character
  (?=.*[[:^alnum:]]) # Must contain a symbol
/x.freeze

  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

  has_many :user_roles, dependent: :destroy
  has_many :roles, through: :user_roles
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password,
            presence: true,
            length: { in: Devise.password_length },
            format: { with: PASSWORD_FORMAT },
            confirmation: true,
            on: :create

  validates :password,
            allow_nil: true,
            length: { in: Devise.password_length },
            format: { with: PASSWORD_FORMAT },
            confirmation: true,
            on: :update

  validates :user_type, presence: true

  enum user_type: { internal: 0, external: 1 }

  def is?(requested_role)
    role = Role.find_by(role_type: requested_role)
    if role
      user_role = UserRole.find_by_sql("SELECT * FROM user_roles WHERE user_id=#{id} AND role_id=#{role.id}")
      return true if user_role.length.positive?
    end
    false
  end
end
