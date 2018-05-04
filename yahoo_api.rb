require 'net/http'
require 'uri'
require 'rexml/document'

puts "検索したい文言を入力してください！"
search_word = gets.chomp

url = URI.parse(URI.escape("http://auctions.yahooapis.jp/AuctionWebService/V2/search?appid=dj0zaiZpPU81djVJZW9rZWFISyZzPWNvbnN1bWVyc2VjcmV0Jng9MmY-&query=#{search_word}"))
res = Net::HTTP.start(url.host, url.port){|http|
    http.get(url.path + "?" + url.query);
}

doc = REXML::Document.new(res.body)

doc.elements.each('ResultSet/Result/Item/') {|i|puts i.elements['Title'].text}
