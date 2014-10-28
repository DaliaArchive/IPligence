require_relative "test_helper"

class ClientTest < MiniTest::Test
  def setup
  end

  def test_initialize
    connection_params = {
      :adapter => "ADAPTER",
      :database => "DATABASE",
      :username => "USERNAME",
      :password => "PASSWORD"
    }

    adapter_mock = mock(:connection => "CONNECTION")

    ActiveRecord::Base.expects(:establish_connection).with(connection_params).returns(adapter_mock)
    client = Ipligence::Client.new("ADAPTER", "DATABASE", "USERNAME", "PASSWORD")

    assert_equal("CONNECTION", client.db)
  end

  def test_data
    client = Ipligence::Client.new("sqlite3", "#{File.dirname(__FILE__)}/db/ipligence.sqlite")

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