require "csv"

# 実行方法: bin/rails db:seed TABLES=t1,t2,t3
# TABLESで指定したテーブルのみupsert
# 未指定の場合はdb/seeds/以下のcsvすべてが多少
pattern = ENV["TABLES"].blank? ? "db/seeds/*.csv" : "db/seeds/{#{ENV["TABLES"]}}.csv"

Dir.glob(Rails.root.join(pattern)).each do |path|
  filename = File.basename(path, ".csv")
  klass = Module.const_get(filename.classify)
  data = CSV.read(path, headers: true).map(&:to_h)
  r = klass.upsert_all(data) if data.present?
  puts "DONE. file: #{filename}, class: #{klass}"
end
