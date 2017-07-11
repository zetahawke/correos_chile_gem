# This class will retreive some information according to param
module Correos
  require 'correos_chile/order'
  require 'httparty'
  require 'nokogiri'

  def self.extract_useless_spaces(str)
    composed_word = ''
    partial_word = str.gsub(/[[:space:]]/, '')
    length = partial_word.length
    str.split(partial_word[length]).each_with_index do |word, i|
      next if word.nil? || word.strip.gsub(/[[:space:]]/, '').empty?
      composed_word += i + 1 == length ? word : "#{word} "
    end
    composed_word
  end

  def self.find(tracking_number)
    form_url = 'http://seguimientoweb.correos.cl/ConEnvCorreos.aspx'
    form_data = {
      obj_key: 'Cor398-cc',
      obj_env: tracking_number
    }
    response = HTTParty.post(form_url, body: form_data, options: { headers: { 'Content-Type' => 'application/x-www-form-urlencoded' } } )
    doc = Nokogiri::HTML.parse(response)
    return "The order doesn't exist" unless doc.css('.titulo').text.include?('Numero de envio')
    attributes = shipping_info(doc)
    Order.new(attributes)
  end

  def self.shipping_info(html_doc)
    table = html_doc.css('.tracking')[0]
    tr = table.css('tr')[1]
    return "Website's structure has change" unless tr
    tr_status = tr.css('td')[0].text.to_s.strip.gsub(/\A\p{Space}*/, '')
    tr_datetime = tr.css('td')[1].text.to_s.strip.gsub(/\A\p{Space}*/, '')
    {
      status: extract_useless_spaces(tr_status).strip,
      datetime: extract_useless_spaces(tr_datetime).strip
    }
  rescue
    "Website's structure has change"
  end
end
