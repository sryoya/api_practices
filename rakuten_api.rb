require 'net/http'
require 'uri'
require 'pry'
require 'json'

puts "検索したい文言を入力してください！"
search_word = gets.chomp

url = URI.parse(URI.escape("https://app.rakuten.co.jp/services/api/IchibaItem/Search/20140222?applicationId=1079998938359809278&keyword=#{search_word}"))
res = Net::HTTP.start(url.host, url.port, use_ssl: true){|http|
    http.get(url.path + "?" + url.query);
}
obj = JSON.parse(res.body)
binding.pry
puts obj