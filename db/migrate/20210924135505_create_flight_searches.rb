class CreateFlightSearches < ActiveRecord::Migration[6.1]
  def change
    create_table :flight_searches do |t|
      t.string :from
      t.string :to
      t.string :departs
      t.string :passengers

      t.timestamps
    end
  end
end
