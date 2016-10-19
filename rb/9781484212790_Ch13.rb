# ----

class CreateEntries < ActiveRecord::Migration[5.0]
  def change
    create_table :entries do |t|
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end

# ----

class EntriesController < ApplicationController
  before_action :set_entry, only: [:show, :edit, :update, :destroy]

  # GET /entries
  # GET /entries.json
  def index
    @entries = Entry.all
  end

  # GET /entries/1
  # GET /entries/1.json
  def show
  end

  # GET /entries/new
  def new
    @entry = Entry.new
  end

  # GET /entries/1/edit
  def edit
  end

  # POST /entries
  # POST /entries.json
  def create
    @entry = Entry.new(entry_params)

    respond_to do |format|
      if @entry.save
        format.html { redirect_to @entry, notice: 'Entry was successfully created.' }
        format.json { render :show, status: :created, location: @entry }
      else
        format.html { render :new }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /entries/1
  # PATCH/PUT /entries/1.json
  def update
    respond_to do |format|
      if @entry.update(entry_params)
        format.html { redirect_to @entry, notice: 'Entry was successfully updated.' }
        format.json { render :show, status: :ok, location: @entry }
      else
        format.html { render :edit }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entries/1
  # DELETE /entries/1.json
  def destroy
    @entry.destroy
    respond_to do |format|
      format.html { redirect_to entries_url, notice: 'Entry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entry
      @entry = Entry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def entry_params
      params.require(:entry).permit(:title, :content)
    end
end

# ----

# GET /entries
# GET /entries.json
def index
  @entries = Entry.all
end

# ----

# <p id="notice"><%= notice %></p>
#
# <h1>Entries</h1>
#
# <table>
#   <thead>
#     <tr>
#       <th>Title</th>
#       <th>Content</th>
#       <th colspan="3"></th>
#     </tr>
#   </thead>
#
#   <tbody>
#     <% @entries.each do |entry| %>
#       <tr>
#         <td><%= entry.title %></td>
#         <td><%= entry.content %></td>
#         <td><%= link_to 'Show', entry %></td>
#         <td><%= link_to 'Edit', edit_entry_path(entry) %></td>
#         <td><%= link_to 'Destroy', entry, method: :delete, data: { confirm: 'Are you sure?' } %></td>
#       </tr>
#     <% end %>
#   </tbody>
# </table>
#
# <br>
#
# <%= link_to 'New Entry', new_entry_path %>

# ----

# <% @entries.each do |entry| %>
#   <tr>
#     <td><%= entry.title %></td>
#     <td><%= entry.content %></td>
#     <td><%= link_to 'Show', entry %></td>
#     <td><%= link_to 'Edit', edit_entry_path(entry) %></td>
#     <td><%= link_to 'Destroy', entry, method: :delete, data: { confirm: 'Are you sure?' } %></td>
#   </tr>
# <% end %>

# ----

# <td><%= link_to 'Show', entry %></td>
# <td><%= link_to 'Edit', edit_entry_path(entry) %></td>
# <td><%= link_to 'Destroy', entry, method: :delete, data: { confirm: 'Are you sure?' } %></td>

# ----

entry = Entry.find(1)
entry.title = 'Title of the first entry'
entry.save

# ----

entry = Entry.find(1)
entry.user.name = 'Name of whoever posted the entry'
entry.user.email = 'Their e-mail address'

# ----

class Entry < ActiveRecord::Base
  belongs_to :user
end

# ----

class User < ActiveRecord::Base
  has_many :entries
end

# ----

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end

# ----

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :count_requests_in_session

  def count_requests_in_session
    session[:requests] ||= 0
    session[:requests] += 1
  end
end

# ----

# <!doctype html>
# <html lang="en">
# <head>
#   <meta charset="utf-8">
#   <title>Page Title Here</title>
#   <link rel="stylesheet" href="styles.css">
# </head>
# <body>

# ----

# <!DOCTYPE html>
# <html>
#   <head>
#     <title>Mydiary</title>
#     <%= csrf_meta_tags %>
#     <%= action_cable_meta_tag %>
#
#     <%= stylesheet_link_tag    'application', media: 'all', 'data-turbolinks-track' => 'reload' %>
#     <%= javascript_include_tag 'application', 'data-turbolinks-track' => 'reload' %>
#   </head>
#
#   <body>
#     <%= yield %>
#   </body>
# </html>

# ----

render :layout => false

# ----

render :layout => 'some_other_layout'

# ----

require 'sinatra'

get '/' do
  "Hello, world!"
end

# ----

require 'sinatra'
get '/' do
  "Hello, world!"
end

get '/bye' do
  "Leaving already?"
end

get '/time' do
  Time.now.to_s
end

# ----

get '/add/:a/:b' do
  (params[:a].to_i + params[:b].to_i).to_s
end

# ----

get '/add/:a/:b' do |a, b|
  (a.to_i + b.to_i).to_s
end

# ----

get '/' do
  %q{<form method="post">
      Enter your name: <input type="text" name="name" />
      <input type="submit" value="Go!" />
    </form>}
end

post '/' do
  "Hello #{params[:name]}!"
end

# ----

before do
  @people = [
             { :name => "Beatrice", :age => 20 },
             { :name => "Eugenie", :age => 18 },
             { :name => "Louise", :age => 6 }
            ]
end

get '/' do
  erb %{
    <% @people.each do |person| %>
      <p><%= person[:name] %> is <%= person[:age] %> years old</p>
    <% end %>
  }
end

# ----

get '/' do
  erb :index
end

__END__

@@ index
  <% @people.each do |person| %>
    <p><%= person[:name] %> is <%= person[:age] %> years old</p>
  <% end %>

# ----

before do
  @people = [
             { :name => "Beatrice", :age => 20 },
             { :name => "Eugenie", :age => 18 },
             { :name => "Louise", :age => 6 }
            ]
end

get '/' do
  erb :index
end

__END__
@@ layout
  <html>
    <head><title>My App</title></head>
  <body>
    <h1>My App</h1>
    <%= yield %>
  </body>
  </html>

@@ index
  <% @people.each do |person| %>
    <p><%= person[:name] %> is <%= person[:age] %> years old</p>
  <% end %>

# ----

erb :index, :layout => :anotherlayout

# ----

erb :index, :layout => false

# ----

set :views, File.dirname( FILE ) + '/templates'

# ----

erb :index, :layout => 'mylayout'

# ----

set :public, File.dirname( FILE ) + '/myfiles'

# ----

require 'sinatra'

get '/' do
  erb :index, :layout => :layout
end

post '/secretdata' do
  erb :secretdata
end

__END__
@@ layout
  <html><head><title>My App</title></head>
  <body><%= yield %></body></html>

@@ index
  <form method="POST" action="/secretdata">
  Password: <input type="text" name="password" />
  <input type="submit" value="Log in" />
  </form>

@@ secretdata
  Here's our secret data: <code>30'N 12'W</code>

# ----

post '/secretdata' do
  redirect '/' if params[:password] != 'xyzzy'
  erb :secretdata
end

# ----

redirect 'http://www.google.com/'

# ----

post '/secretdata' do
  halt 403 if params[:password] != 'xyzzy'
  erb :secretdata
end

# ----

require 'sinatra'
not_found do
  "<html><body>Sorry, you're lost!</body></html>"
end

# ----

require 'rubygems'
require 'sinatra'

set :show_exceptions, false

error do
  redirect 'http://en.wikipedia.org/wiki/Division_by_zero'
end

get '/divide/:a/:b' do |a, b|
  "#{a.to_i / b.to_i}"
end

# ----

