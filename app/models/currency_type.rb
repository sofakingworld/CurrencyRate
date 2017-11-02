# == Schema Information
#
# Table name: currency_types
#
#  id          :integer          not null, primary key
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  nominal     :integer
#  external_id :string
#  char_code   :string
#

# Информация по типу валюты, номиналу и т.п. 
# Внешний ID - ID цб
class CurrencyType < ApplicationRecord
    validates  :title, presence: true
    def nominal_and_title
        "#{nominal} #{title}"
    end
end
