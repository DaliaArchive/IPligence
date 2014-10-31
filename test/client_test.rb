require_relative "test_helper"

class ClientTest < MiniTest::Test
  def setup
  end

  def test_initialize
    adapter_mock = mock(:connection => "CONNECTION")

    ActiveRecord::Base.expects(:establish_connection).with("OPTS").returns(adapter_mock)
    client = Ipligence::Client.new("OPTS")

    assert_equal("CONNECTION", client.connection)
  end

  def test_data
    client = Ipligence::Client.new(:adapter => "sqlite3", :database => "#{File.dirname(__FILE__)}/db/ipligence.sqlite")

    data = client.data("2.84.170.255")
    assert_equal(39102976, data[:ip_from])
    assert_equal(39103231, data[:ip_to])
    assert_equal("GR", data[:country_code])
    assert_equal("GREECE", data[:country_name])
    assert_equal("EU", data[:continent_code])
    assert_equal("EUROPE", data[:continent_name])
    assert_equal("GMT+2", data[:time_zone])
    assert_equal("", data[:region_code])
    assert_equal("", data[:region_name])
    assert_equal("MULTIPROTOCOL SERVICE PROVIDER TO OTHER ISP S AND END USERS", data[:owner])
    assert_equal("VOULA", data[:city_name])
    assert_equal("", data[:county_name])
    assert_equal("", data[:post_code])
    assert_equal("", data[:area_code])
    assert_equal("", data[:metro_code])
    assert_equal(37.85, data[:latitude])
    assert_equal(23.77, data[:longitude])
  end

end