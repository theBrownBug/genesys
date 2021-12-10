# frozen_string_literal: true

class AddSessionIdToVisit < ActiveRecord::Migration[6.1]
  def change
    add_column :visits, :session_id, :string
  end
end
