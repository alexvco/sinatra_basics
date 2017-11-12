require 'sinatra'
require_relative  'MyHelpers'


set :server, :puma
set :port, 3000

# To run this in development, type ruby app.rb

get '/' do
  erb :home
end



##---------------------------------------------------------------##
# 2 different ways to include helper methods
##---------------------------------------------------------------##

# inline
helpers do
  def printmyname
   "ABC"
  end
end

# external file
helpers MyHelpers





##---------------------------------------------------------------##
# before and after filters
##---------------------------------------------------------------##

before '/protected/*' do
  # authenticate!
end

after '/create/:slug' do |slug|
  # session[:last_slug] = slug
end

# or if you want before all routes simply do

before do
  # your code here
end






##---------------------------------------------------------------##
# Database    
##---------------------------------------------------------------##

# Choose your ORM

# Mongoid.load!(./mongoid.yml)

# Datamapper.setup(:default, ENV['DATABASE_URL'] || "sqlite3://#{Dir.pwd}/development.rb") 

# class example < ActiveRecord::Base

# DB = Sequel.sqlite


# This is for psql
# configure :development do
#   set :database, {adapter: 'postgresql',  encoding: 'unicode', database: 'your_database_name', pool: 2, username: 'your_username', password: 'your_password'}
# end

# configure :production do
#   set :database, {adapter: 'postgresql',  encoding: 'unicode', database: 'your_database_name', pool: 2, username: 'your_username', password: 'your_password'}
# end









##---------------------------------------------------------------##
# You can modify the default "public" folder to an "asset" folder
##---------------------------------------------------------------##


# set :public_folder, Proc.new { File.join(root, "assets/css") }

# get('application.scss') { scss :styles}
# set :assets, Proc.new { Sprockets::Environment.new(root) {|env|
#   env.append_path File.join( root, "/assets/js")
#   env.append_path File.join(root, "/assets/css")
#   # more…
# }}



