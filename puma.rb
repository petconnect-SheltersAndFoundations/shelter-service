# puma.rb
port ENV.fetch("PORT") { 3018 }
environment ENV.fetch("RACK_ENV") { "production" }
workers 1
threads 1, 5
preload_app!
