require "active_record"
require "CSV"
require "minitest/autorun"
require "mocha/setup"
require_relative "../lib/ipligence"

FileUtils.rm("#{File.dirname(__FILE__)}/db/ipligence.sqlite", :force => true)

@db = ActiveRecord::Base.establish_connection(
  :adapter  => "sqlite3",
  :database => "#{File.dirname(__FILE__)}/db/ipligence.sqlite"
)

load("#{File.dirname(__FILE__)}/schema.rb")

CSV.foreach("#{File.dirname(__FILE__)}/db/ipligencepro.csv") do |row|
  insert_query =
    "INSERT INTO ipligence2 (ip_from, ip_to, country_code, country_name, continent_code, continent_name, time_zone, region_code, region_name, owner, city_name, county_name, post_code, area_code, metro_code, latitude, longitude)
    VALUES (#{row[0]}, #{row[1]}, '#{row[2]}', '#{row[3]}', '#{row[4]}', '#{row[5]}', '#{row[6]}', '#{row[7]}', '#{row[8]}', '#{row[9]}', '#{row[10]}', '#{row[11]}', '#{row[12]}', '#{row[13]}', '#{row[14]}', #{row[15]}, #{row[16]})"
  @db.connection.execute(insert_query)
end

ActiveRecord::Base.remove_connection