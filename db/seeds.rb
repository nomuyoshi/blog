require "csv"

Dir.glob(Rails.root.join("db/seeds/*.csv",)).each do |path|
  filename = File.basename(path, ".csv")
  klass = Module.const_get(filename.classify)
  data = CSV.read(path, headers: true).map(&:to_h)
  r = klass.upsert_all(data) if data.present?
  puts "DONE. file: #{filename}, class: #{klass}"
end
