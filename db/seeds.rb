# Данные по валютам из ЦБ
puts 'Данные по валютам из ЦБ'
CurrencyType.create(title: 'Российский рубль', char_code: 'RUB', nominal: '1', external_id: nil)
CurrencyType.create(title: 'Австралийский доллар', char_code: 'AUD', nominal: '1', external_id:'R01010')
CurrencyType.create(title: 'Азербайджанский манат', char_code: 'AZN', nominal: '1', external_id:'R01020A')
CurrencyType.create(title: 'Фунт стерлингов Соединенного королевства', char_code: 'GBP', nominal: '1', external_id:'R01035')
CurrencyType.create(title: 'Армянских драмов', char_code: 'AMD', nominal: '100', external_id:'R01060')
CurrencyType.create(title: 'Белорусский рубль', char_code: 'BYN', nominal: '1', external_id:'R01090B')
CurrencyType.create(title: 'Болгарский лев', char_code: 'BGN', nominal: '1', external_id:'R01100')
CurrencyType.create(title: 'Бразильский реал', char_code: 'BRL', nominal: '1', external_id:'R01115')
CurrencyType.create(title: 'Венгерских форинтов', char_code: 'HUF', nominal: '100', external_id:'R01135')
CurrencyType.create(title: 'Гонконгских долларов', char_code: 'HKD', nominal: '10', external_id:'R01200')
CurrencyType.create(title: 'Датских крон', char_code: 'DKK', nominal: '10', external_id:'R01215')
CurrencyType.create(title: 'Доллар США', char_code: 'USD', nominal: '1', external_id:'R01235')
CurrencyType.create(title: 'Евро', char_code: 'EUR', nominal: '1', external_id:'R01239')
CurrencyType.create(title: 'Индийских рупий', char_code: 'INR', nominal: '100', external_id:'R01270')
CurrencyType.create(title: 'Казахстанских тенге', char_code: 'KZT', nominal: '100', external_id:'R01335')
CurrencyType.create(title: 'Канадский доллар', char_code: 'CAD', nominal: '1', external_id:'R01350')
CurrencyType.create(title: 'Киргизских сомов', char_code: 'KGS', nominal: '100', external_id:'R01370')
CurrencyType.create(title: 'Китайских юаней', char_code: 'CNY', nominal: '10', external_id:'R01375')
CurrencyType.create(title: 'Молдавских леев', char_code: 'MDL', nominal: '10', external_id:'R01500')
CurrencyType.create(title: 'Норвежских крон', char_code: 'NOK', nominal: '10', external_id:'R01535')
CurrencyType.create(title: 'Польский злотый', char_code: 'PLN', nominal: '1', external_id:'R01565')
CurrencyType.create(title: 'Румынский лей', char_code: 'RON', nominal: '1', external_id:'R01585F')
CurrencyType.create(title: 'СДР (специальные права заимствования)', char_code: 'XDR', nominal: '1', external_id:'R01589')
CurrencyType.create(title: 'Сингапурский доллар', char_code: 'SGD', nominal: '1', external_id:'R01625')
CurrencyType.create(title: 'Таджикских сомони', char_code: 'TJS', nominal: '10', external_id:'R01670')
CurrencyType.create(title: 'Турецкая лира', char_code: 'TRY', nominal: '1', external_id:'R01700J')
CurrencyType.create(title: 'Новый туркменский манат', char_code: 'TMT', nominal: '1', external_id:'R01710A')
CurrencyType.create(title: 'Узбекских сумов', char_code: 'UZS', nominal: '10000', external_id:'R01717')
CurrencyType.create(title: 'Украинских гривен', char_code: 'UAH', nominal: '10', external_id:'R01720')
CurrencyType.create(title: 'Чешских крон', char_code: 'CZK', nominal: '10', external_id:'R01760')
CurrencyType.create(title: 'Шведских крон', char_code: 'SEK', nominal: '10', external_id:'R01770')
CurrencyType.create(title: 'Швейцарский франк', char_code: 'CHF', nominal: '1', external_id:'R01775')
CurrencyType.create(title: 'Южноафриканских рэндов', char_code: 'ZAR', nominal: '10', external_id:'R01810')
CurrencyType.create(title: 'Вон Республики Корея', char_code: 'KRW', nominal: '1000', external_id:'R01815')
CurrencyType.create(title: 'Японских иен', char_code: 'JPY', nominal: '100', external_id:'R01820')

# Загрузка данных из ЦБ
puts 'Загрузка данных из ЦБ'
100.times do |i|
    print "#{i}/100 \r"
    cbk_job("http://www.cbr.ru/scripts/XML_daily.asp?date_req=#{(Date.today-i).strftime("%d/%m/%Y")}")
end   

# Профиль пользователя для тестирования /admin
puts 'Профиль пользователя для тестирования /admin'
puts '-> email: funbox_test@valute.ru'
puts '-> pwd: funbox'
User.create!({
    :email => 'funbox_test@valute.ru',
    :password => 'funbox',
    :password_confirmation => 'funbox' 
})