class AddTimeToFlights < ActiveRecord::Migration[6.1]
  def change
    add_column :flights, :time, :string
  end
end
