require "active_record"

class IPligence::Client

  attr_reader :connection

  def initialize(opts)
    @connection = IPligence::DBConnection.establish_connection(opts).connection
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
      :county_name => result["county_name"],
      :post_code => result["post_code"],
      :area_code => result["area_code"],
      :metro_code => result["metro_code"],
      :latitude => result["latitude"],
      :longitude => result["longitude"]
    }
  end

  private
    def query(ip)
      long_ip = IPligence::Utils.convert_dotted_to_long(ip).to_s
      data_fields = "ip_from, ip_to, country_code, country_name, continent_code, continent_name, time_zone, region_code, region_name, owner, city_name, county_name, post_code, area_code, metro_code, latitude, longitude"
      sql_query = "select #{data_fields} from ipligence2 where ip_from <= '#{long_ip}' and '#{long_ip}' <= ip_to"
      connection.exec_query(sql_query).first
    end

end