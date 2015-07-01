require 'sinatra'
require 'httparty'
require 'nokogiri'
response = HTTParty.get('Http://finance.yahoo.com/q?s=AAPL')
dom = Nokogiri::HTML(response.body)
list_of_results =  dom.xpath("//span[@id='yfs_l84_aapl']")
result = list_of_results.first

get '/' do
  "The current price of AAPL is $#{result.text}"
end
