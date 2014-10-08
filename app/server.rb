require 'sinatra'
require 'rack-flash'
require 'data_mapper'
require './app/models/link'
require './app/models/user'
require './app/models/tag'
require_relative 'helpers/application'
require_relative 'data_mapper_setup'
require_relative 'controllers/users'
require_relative 'controllers/sessions'
require_relative 'controllers/links'
require_relative 'controllers/tags'
require_relative 'controllers/application'

use Rack::Flash, :sweep => true

enable :sessions
set :session_secret, 'super secret'
