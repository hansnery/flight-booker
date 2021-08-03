class CreateFlights < ActiveRecord::Migration[6.1]
  def change
    create_table :flights do |t|
      t.bigint :from_id
      t.bigint :to_id
      t.datetime :datetime
      t.integer :flight_duration

      t.timestamps
    end
  end
end
