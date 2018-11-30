#json.extract! モデルオブジェクトの指定したカラム要素のキーと値のペアのハッシュを出力
json.places do
  json.array! @places do |place|
    json.extract! place, :id, :name, :address, :latitude, :longitude
  end
end










# {"places":
#   [
#     {"id":11,"name":"いいいい","address":"埼玉県,比企郡,ときがわ町,関堀","latitude":null,"longitude":null},
#     {"id":10,"name":"あああ","address":"埼玉県,比企郡,ときがわ町,関堀","latitude":35.997326,"longitude":139.233064894701},
#     {"id":9,"name":"ああ","address":"東京都,新宿区,西新宿","latitude":35.6944228,"longitude":139.6927786},
#     {"id":8,"name":"あああ","address":"東京都墨田区,押上","latitude":35.7091074,"longitude":139.8128663},
#     {"id":7,"name":"東京タワー","address":"東京タワー","latitude":35.65858645,"longitude":139.745440057962},
#     {"id":6,"name":"都庁","address":"東京都庁","latitude":35.6889382,"longitude":139.7616031},
#     {"id":5,"name":"都庁","address":"東京都新宿区西新宿２丁目８−１","latitude":null,"longitude":null},
#     {"id":4,"name":"皇居","address":"東京都千代田区","latitude":35.6938097,"longitude":139.7532163},
#     {"id":3,"name":"スカイツリー","address":"東京都墨田区","latitude":35.700429,"longitude":139.805017},
#     {"id":2,"name":"スカイツリー","address":"東京都墨田区","latitude":null,"longitude":null},
#     {"id":1,"name":"スカイツリー","address":"東京都墨田区押上１丁目１−２","latitude":null,"longitude":null}
#   ]
# }
