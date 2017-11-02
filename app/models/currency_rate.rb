# == Schema Information
#
# Table name: currency_rates
#
#  id                      :integer          not null, primary key
#  first_currency_type_id  :integer
#  second_currency_type_id :integer
#  first_value             :decimal(, )
#  second_value            :decimal(, )
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#

# В данную модель заложены поля для двух валют
# по умолчанию выборка из ЦБ, поэтому первая валюта - РУБЛЬ
# Вторая - любая другая
# Сделано это для возможности в дальнейшем пересчета курса валют, например EUR к USD
class CurrencyRate < ApplicationRecord
    belongs_to :CurrencyType, primary_key: "id", foreign_key: "first_currency_type_id"
	belongs_to :CurrencyType, primary_key: "id", foreign_key: "second_currency_type_id"
	validates  :first_value, :second_value, presence: true
	validate  :currency_types_cant_be_same

	def currency_types_cant_be_same
		if (first_currency_type_id == second_currency_type_id) then
			errors.add(:currency_types_cant_be_same, "currency types can't be same")
		end
	end
end
