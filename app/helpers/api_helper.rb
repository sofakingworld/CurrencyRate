module ApiHelper
    def currencies_and_rates_for_100_days
        {
            currencies: CurrencyType.all.order(title: :asc).to_a, 
            rates: CurrencyRate.where('created_at >= ?',Date.today-100)
                 .order(second_currency_type_id: :asc, created_at: :asc)
        }
    end

    def currency_current_rate(id)
        
        [].tap do |r|
            CurrencyType.where(id: id).each do |v| 
                r<<{ 
                        valute: v,
                        last_rate: v ? forced_currency_or_real(v.id) : nil
                }
            end
        end
    end

    private 

    # Вывод последнего актуального курса по выбранной валюте
    # Если курс был форсирован, но его время уже закончилось 
    # То берется предыдущее значение
    def forced_currency_or_real(id, exclude_list = [])
        cr = CurrencyRate.where(second_currency_type_id: id).where.not(id: exclude_list)
                .order(created_at: :asc).last
        
        fr = ForcedRate.find_by(currency_rate_id: cr.id) if cr
        if fr && fr.forced_till < Time.now then
            return forced_currency_or_real(id, exclude_list<<cr.id)
        else 
            return cr
        end
    end

end
