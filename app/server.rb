require 'sinatra'
require 'rack-flash'
require 'data_mapper'
require './app/models/link'
require './app/models/user'
require './app/models/tag'
require 'sinatra/partial'
require_relative 'helpers/application'
require_relative 'data_mapper_setup'
require_relative 'controllers/users'
require_relative 'controllers/sessions'
require_relative 'controllers/links'
require_relative 'controllers/tags'
require_relative 'controllers/application'
require_relative 'controllers/request_password'

use Rack::Flash, :sweep => true

enable :sessions
set :session_secret, 'super secret'
set :public_folder, Proc.new{ File.join(root, '..', 'public') }
set :partial_template_engine, :erb
