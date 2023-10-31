class AddPriceToLineItem < ActiveRecord::Migration[7.0]
  def change
    add_column :line_items, :price, :decimal
  end
end
