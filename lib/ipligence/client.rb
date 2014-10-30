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
    result = query(ip)

    {
      :ip_from => result["ip_from"],
      :ip_to => result["ip_to"],
      :country_code => result["country_code"],
      :country_name => result["country_name"],
      :continent_code => result["continent_code"],
      :continent_name => result["continent_name"],
      :time_zone => result["time_zone"],
      :region_code => result["region_code"],
      :region_name => result["region_name"],
      :owner => result["owner"],
      :city_name => result["city_name"],
      :country_name => result["country_name"],
      :post_code => result["post_code"],
      :area_code => result["area_code"],
      :metro_code => result["metro_code"],
      :latitude => result["latitude"],
      :longitude => result["longitude"]
    }
  end

  private
    def query(ip)
      long_ip = Ipligence::Utils.convert_dotted_to_long(ip).to_s
      data_fields = "ip_from, ip_to, country_code, country_name, continent_code, continent_name, time_zone, region_code, region_name, owner, city_name, country_name, post_code, area_code, metro_code, latitude, longitude"
      sql_query = "select #{data_fields} from ipligence2 where ip_from <= '#{long_ip}' and '#{long_ip}' <= ip_to"
      self.db.exec_query(sql_query).first
    end

end