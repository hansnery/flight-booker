class AddDateToFlights < ActiveRecord::Migration[6.1]
  def change
    add_column :flights, :date, :string
  end
end
