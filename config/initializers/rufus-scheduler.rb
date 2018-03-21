require 'rufus-scheduler'

scheduler = Rufus::Scheduler.new

scheduler.every '6h' do |job|
    CurrencyRate.delete_all
    
    100.times do |i|
        print "#{i}/100 \r"
        cbk_job("http://www.cbr.ru/scripts/XML_daily.asp?date_req=#{(Date.today-i).strftime("%d/%m/%Y")}")
    end
end   
    
def cbk_job(url)
    response = HTTParty.get(url) 
    logger = Logger.new('./log/cbk.log', 'weekly')
    logger.info("schedule rbk job - #{url}")

    if response.code == 200 then
        logger.info(response.code)
        
        rub = CurrencyType.find_by(char_code: 'RUB', external_id: nil)
        response_hash = Hash.from_xml(response.body)
        response_hash['ValCurs']['Valute'].each do |val| 
            val_in_base = CurrencyType.find_by(external_id: val['ID'])

            CurrencyRate.create(first_currency_type_id: rub.id,
                second_currency_type_id: val_in_base.id,
                first_value: val['Value'].gsub(',','.'),
                second_value: val['Nominal'].gsub(',','.'),
                created_at: response_hash['ValCurs']['Date']
            ) if val_in_base
        end
    else 
        logger.warn(response.code)    
    end
end