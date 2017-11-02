# == Schema Information
#
# Table name: forsed_rates
#
#  id               :integer          not null, primary key
#  currency_rate_id :integer
#  user_id          :integer
#  forsed_till      :datetime
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

# Форсированные курсы
# Хранит информацию авторе форсификации
# времени действия и ссылается на конкретный курс
class ForcedRate < ApplicationRecord
    belongs_to :user
    belongs_to :currency_rate
    validates  :user_id, :forced_till, presence: true
end
