require 'rubygems'
require 'dm-core'
require 'dm-types'
require 'dm-timestamps'
require 'dm-validations'
require 'dm-aggregates'
require 'haml'
require 'geoip'

require 'sinatra' unless defined?(Sinatra)

# Database setup.
DataMapper.setup(:default, ENV['DATABASE_URL'] || 'mysql://root:dx87vv30@localhost/geolocation')

# Load Models
require 'models'