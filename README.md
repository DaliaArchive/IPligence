# Ipligence

A ruby gem to integrate the [IPligence database](http://ipligence.com/)

## Installation

Add this line to your application's Gemfile:

    gem "ipligence"

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ipligence

## Set up

    curl -O http://www.ipligence.com/pickup/<SOME CODE HERE>/ipligence-pro.mysqldump.sql.gz
    gunzip ipligence-pro.mysqldump.sql.gz
    mysql -uusername -ppassword database < ipligence-pro.mysqldump.sql

## Usage

The gem needs an IPligence database. After you create it you can configure the `Ipligence::Client`:

    client = Ipligence::Client.new("adapter", "database", "username", "password")

Then, you can get a hash with the geodata for a given IP using the client's `data` method:

    data = client.data("0.0.0.0")

For example, querying for `195.130.124.1` returns the following hash:

    => {:ip_from=>"3280108544", :ip_to=>"3280109567", :country_code=>"GR", :country_name=>"GREECE",
        :continent_code=>"EU", :continent_name=>"EUROPE", :time_zone=>"GMT+2", :region_code=>"",
        :region_name=>"", :owner=>"IONIAN UNIVERSITY", :city_name=>"CORFU", :country_name=>"",
        :post_code=>"", :area_code=>"", :metro_code=>"", :latitude=>"39.62", :longitude=>"19.9197"}

## Contributing

1. Fork it (https://github.com/DaliaResearch/Ipligence/fork)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Issue a new pull request (https://github.com/DaliaResearch/Ipligence/pulls)