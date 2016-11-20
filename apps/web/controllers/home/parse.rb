require 'lulalala_address_tokenizer'

ATTRIBUTE_NAMES_IN_CHINESE = {
  postcode: '郵遞區號',
  city: '縣市',
  district: '鄉鎮市區',
  subdistrict: '村里',
  neighborhood: '鄰',
  street: '路',
  xiang: '巷',
  nong: '弄',
  housenumber: '號碼'
}

module Web::Controllers::Home
  class Parse
    include Web::Action

    expose :result

    def call(params)
      t = LulalalaAddressTokenizer.new("address.mod")
      @result = t.parse(params[:address][:address])
    end
  end
end
