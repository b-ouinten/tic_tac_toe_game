require 'bundler'
Bundler.require

$:.unshift File.expand_path("./../lib", __FILE__)
require 'app/game'
require 'app/grid'
require 'app/player'
require 'app/token'
require 'app/application'
require 'view/show'

app = Application.new
app.main

binding.pry