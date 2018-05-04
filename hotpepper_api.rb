require 'net/http'
require 'uri'
require 'rexml/document'

url = URI.parse(URI.escape("http://webservice.recruit.co.jp/hotpepper/gourmet/v1/?key=984e92505d475bc4&middle_area=Y030&free_drink=1&special=LU0004&count=20"))
res = Net::HTTP.start(url.host, url.port){|http|
    http.get(url.path + "?" + url.query);
}

doc = REXML::Document.new(res.body)
doc.elements.each('results/shop/') {|i|puts i.elements['name'].text}

#渋谷はY030
#free_drinkは1


#http://webservice.recruit.co.jp/hotpepper/gourmet/v1/?key=984e92505d475bc4&free_drink=1
#elementsを二回に分けてパスを指定するときは、一回目と二回目でおなじタグを指定しない
#LU0004


# url = URI.parse(URI.escape("http://webservice.recruit.co.jp/hotpepper/special/v1/?key=984e92505d475bc4"))
# res = Net::HTTP.start(url.host, url.port){|http|
#     http.get(url.path + "?" + url.query);
# }

# doc = REXML::Document.new(res.body)
# puts doc
