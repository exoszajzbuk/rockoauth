require 'factory_girl'

Factory.sequence :client_name do |n|
  "Client ##{n}"
end

Factory.sequence :user_name do |n|
  "User ##{n}"
end

Factory.define :owner, :class => TestApp::User do |u|
  u.name { Factory.next :user_name }
end

Factory.define :client, :class => RockOAuth::Model::Client do |c|
  c.client_id     { RockOAuth.random_string }
  c.client_secret { RockOAuth.random_string }
  c.name          { Factory.next :client_name }
  c.redirect_uri  'https://client.example.com/cb'
end
