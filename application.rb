require 'rubygems'
require 'sinatra'
require 'environment'

# not_found do
#   'Not found'
# end

# error do
#   'Doh! error - ' + env['sinatra.error'].name
# end

helpers do
  # add some helpers.
end

get '/' do
  ip_address = '83.99.239.4'
#  ip_address = @env['REMOTE_ADDR']

  @ip1, @time1 = IpGroupCity.find_by_ip(ip_address)
  @ip2, @time2 = MaxMind.find_by_ip(ip_address)

  haml :home
end