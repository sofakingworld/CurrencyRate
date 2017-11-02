class CreateForcedRates < ActiveRecord::Migration[5.1]
  def change
    create_table :forced_rates do |t|
      t.integer :currency_rate_id
      t.integer :user_id
      t.datetime :forced_till

      t.timestamps
    end
  end
end
