class AddNominalAndExternalIdToCurrencyType < ActiveRecord::Migration[5.1]
  def change
    add_column :currency_types, :nominal, :integer
    add_column :currency_types, :external_id, :string
  end
end
