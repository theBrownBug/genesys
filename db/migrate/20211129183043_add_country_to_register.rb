# frozen_string_literal: true

class AddCountryToRegister < ActiveRecord::Migration[6.1]
  def change
    add_column :registers, :country, :string
  end
end
