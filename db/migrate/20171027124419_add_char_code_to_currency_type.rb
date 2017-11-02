class AddCharCodeToCurrencyType < ActiveRecord::Migration[5.1]
  def change
    add_column :currency_types, :char_code, :string
  end
end
