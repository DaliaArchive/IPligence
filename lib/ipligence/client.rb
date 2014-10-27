require "active_record"

class Ipligence::Client

  attr_accessor :db

  def initialize(adapter, database, username = "root", password = "")
    @db = ActiveRecord::Base.establish_connection(
      :adapter => adapter,
      :database => database,
      :username => username,
      :password => password
    )
  end

  def get_data(dotted_ip)
    long_ip = Ipligence::Utils.convert_dotted_to_long(dotted_ip).to_s
    sql_query = "select * from ipligence2 where ip_from <= '#{long_ip}' and '#{long_ip}' <= ip_to"
    @db.connection.execute(sql_query).first
  end

  def data_hash(dotted_ip)
    data = self.get_data(dotted_ip)
    {
      :ipblock_from => data[0],
      :ipblock_to   => data[1],
      :country_code => data[2],
      :country_name => data[3],
      :continent_code => data[4],
      :continent_name => data[5],
      :time_zone => data[6],
      :region_code => data[7],
      :region_name => data[8],
      :owner => data[9],
      :city_name => data[10],
      :county_name => data[11],
      :post_code => data[12],
      :area_code => data[13],
      :metro_code => data[14],
      :latitude => data[15],
      :longitude => data[16]
    }
  end

end