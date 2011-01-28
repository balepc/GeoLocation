class MaxMind  
  attr_accessor :geoip
  attr_accessor :city
  GEOIP = GeoIP.new(SETTINGS['geocity_path'])

  def initialize(city)
    self.city = city
  end

  def self.find_by_ip(ip_address)
    timer = Time.now
      city = GEOIP.city(ip_address)
    timer = Time.now - timer

    [MaxMind.new(city), timer]
  end

  def country_name
    @city[4]
  end
  def city
    @city[7]
  end
  def zipcode
    @city[8]
  end
  def latitude
    @city[9]
  end
  def longitude
    @city[10]
  end

  def gmap_url
    "http://maps.google.com/maps/api/staticmap?center=#{latitude},#{longitude}&zoom=14&size=400x400&sensor=true&markers=color:blue|label:S|#{latitude},#{longitude}"
  end
  
end



class IpGroupCity
  include DataMapper::Resource

  storage_names[:default] = "ip_group_city"

  property :ip_start, Integer, :key => true
  property :country_code, String
  property :country_name, String
  property :region_code, String
  property :region_name, String
  property :city, String
  property :zipcode, String
  property :latitude, Float
  property :longitude, Float
  property :metrocode, Integer

  def self.find_by_ip(ip_address)
    timer = Time.now
      geoip = IpGroupCity.first(:conditions =>["ip_start <= INET_ATON('#{ip_address}')"], :order=>[ :ip_start.desc ])
    timer = Time.now - timer
    [geoip, timer]
  end

  def gmap_url
    "http://maps.google.com/maps/api/staticmap?center=#{latitude},#{longitude}&zoom=14&size=400x400&sensor=true&markers=color:blue|label:S|#{latitude},#{longitude}"
  end
  
end