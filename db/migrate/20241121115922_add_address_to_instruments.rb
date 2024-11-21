class AddAddressToInstruments < ActiveRecord::Migration[7.1]
  def change
    add_column :instruments, :address, :string
    add_column :instruments, :available_from, :date
    add_column :instruments, :available_until, :date
    add_column :instruments, :price_per_day, :integer
  end
end
