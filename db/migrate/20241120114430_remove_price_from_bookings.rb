class RemovePriceFromBookings < ActiveRecord::Migration[7.1]
  def change
    remove_column :bookings, :price, :integer
    remove_column :bookings, :rating, :integer
    remove_column :bookings, :name, :string
  end
end
