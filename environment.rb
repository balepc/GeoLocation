require 'rubygems'
require 'dm-core'
require 'dm-types'
require 'dm-timestamps'
require 'dm-validations'
require 'dm-aggregates'
require 'haml'
require 'erb'
require 'geoip'

require 'sinatra' unless defined?(Sinatra)

# Settings
SETTINGS = YAML::load(ERB.new(IO.read('config/settings.yml')).result)[ENV['RACK_ENV']]

# Database setup.
DataMapper.setup(:default, ENV['DATABASE_URL'] || SETTINGS['database_url'])

# Load Models
require 'models'