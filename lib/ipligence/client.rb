require "active_record"

class Ipligence::Client

  attr_accessor :db

  def initialize(adapter, database, username = "root", password = "")
    self.db = ActiveRecord::Base.establish_connection(
      :adapter => adapter,
      :database => database,
      :username => username,
      :password => password
    ).connection
  end

  def data(ip)
    data = query(ip)

    {
      :ipblock_from => data[1],
      :ipblock_to   => data[2],
      :country_code => data[3],
      :country_name => data[4],
      :continent_code => data[5],
      :continent_name => data[6],
      :time_zone => data[7],
      :region_code => data[8],
      :region_name => data[9],
      :owner => data[10],
      :city_name => data[11],
      :county_name => data[12],
      :post_code => data[13],
      :area_code => data[14],
      :metro_code => data[15],
      :latitude => data[16],
      :longitude => data[17]
    }
  end

  private
    def query(ip)
      long_ip = Ipligence::Utils.convert_dotted_to_long(ip).to_s
      sql_query = "select * from ipligence2 where ip_from <= '#{long_ip}' and '#{long_ip}' <= ip_to"
      self.db.execute(sql_query).first
    end

end