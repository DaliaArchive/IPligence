ActiveRecord::Schema.define :version => 0 do
  create_table :ipligence2 do |t|
    t.integer  :ip_from,  default: 0000000000, null: false
    t.integer  :ip_to,    default: 0000000000, null: false
    t.string   :country_code,                  null: false
    t.string   :country_name,                  null: false
    t.string   :continent_code,                null: false
    t.string   :continent_name,                null: false
    t.string   :time_zone,                     null: false
    t.string   :region_code,                   null: false
    t.string   :region_name,                   null: false
    t.string   :owner,                         null: false
    t.string   :city_name,                     null: false
    t.string   :county_name,                   null: false
    t.string   :post_code,                     null: false
    t.string   :area_code,                     null: false
    t.string   :metro_code,                    null: false
    t.decimal  :latitude,                      null: false
    t.decimal  :longitude,                     null: false
  end
end
