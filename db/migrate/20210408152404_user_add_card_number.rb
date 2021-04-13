class UserAddCardNumber < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :card_number, :string #, default: 0
  end
end
