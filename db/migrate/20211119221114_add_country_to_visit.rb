# frozen_string_literal: true

class AddCountryToVisit < ActiveRecord::Migration[6.1]
  def change
    add_column :visits, :country, :string
  end
end
