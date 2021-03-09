require 'simplecov'
SimpleCov.start

puts "SimpleCov started successfully"

require 'minitest/autorun'
require 'minitest/pride'
require './lib/night_writer'
require './lib/night_reader'
require './lib/code_reader'
require './lib/braille_maker'
require './lib/alpha_maker'
require 'mocha/minitest'
