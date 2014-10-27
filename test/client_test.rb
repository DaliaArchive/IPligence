require_relative "test_helper"

class ClientTest < MiniTest::Test
  def setup
    @client = Ipligence::Client.new("mysql", "database", "username", "password")
    @db = @client.db
  end

  def test_initialize
    assert_equal(ActiveRecord::ConnectionAdapters::ConnectionPool, @db.class)

    config = @db.spec.config
    assert_equal("mysql", config[:adapter])
    assert_equal("database", config[:database])
    assert_equal("username", config[:username])
    assert_equal("password", config[:password])
  end

  def test_get_data
    mock_long_ip = mock()

    Ipligence::Utils.expects(:convert_dotted_to_long).with("DOTTED_IP").returns(mock_long_ip)
    mock_long_ip.expects(:to_s).returns("LONG_IP")

    mock_connection = mock()
    @db.expects(:connection).returns(mock_connection)

    mock_data = mock()
    sql_query = "select * from ipligence2 where ip_from <= 'LONG_IP' and 'LONG_IP' <= ip_to"
    mock_connection.expects(:execute).with(sql_query).returns(mock_data)

    mock_data.expects(:first)

    @client.get_data("DOTTED_IP")
  end

  def test_data_hash
    data = ["IPFROM", "IPTO", "COUNTRY_CODE", "COUNTRY_NAME", "CONTINENT_CODE", "CONTINENT_NAME", "TIME_ZONE", "REGION_CODE", "REGION_NAME", "OWNER", "CITY_NAME", "COUNTY_NAME", "POST_CODE", "AREA_CODE", "METRO_CODE", "LATITUDE", "LONGITUDE"]
    @client.stubs(:get_data).with("LONG_IP").returns(data)
    data_hash = @client.data_hash("LONG_IP")

    assert_equal("IPFROM", data_hash[:ipblock_from])
    assert_equal("IPTO", data_hash[:ipblock_to])
    assert_equal("COUNTRY_CODE", data_hash[:country_code])
    assert_equal("COUNTRY_NAME", data_hash[:country_name])
    assert_equal("CONTINENT_CODE", data_hash[:continent_code])
    assert_equal("CONTINENT_NAME", data_hash[:continent_name])
    assert_equal("TIME_ZONE", data_hash[:time_zone])
    assert_equal("REGION_CODE", data_hash[:region_code])
    assert_equal("REGION_NAME", data_hash[:region_name])
    assert_equal("OWNER", data_hash[:owner])
    assert_equal("CITY_NAME", data_hash[:city_name])
    assert_equal("COUNTY_NAME", data_hash[:county_name])
    assert_equal("POST_CODE", data_hash[:post_code])
    assert_equal("AREA_CODE", data_hash[:area_code])
    assert_equal("METRO_CODE", data_hash[:metro_code])
    assert_equal("LATITUDE", data_hash[:latitude])
    assert_equal("LONGITUDE", data_hash[:longitude])
  end

end