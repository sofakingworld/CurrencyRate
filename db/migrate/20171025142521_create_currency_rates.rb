class CreateCurrencyRates < ActiveRecord::Migration[5.1]
  def change
    create_table :currency_rates do |t|
      t.integer :first_currency_type_id
      t.integer :second_currency_type_id
      t.numeric :first_value
      t.numeric :second_value

      t.timestamps
    end
  end
end
