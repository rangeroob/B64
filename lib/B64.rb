#! /usr/bin/env_ruby
require 'base64'
require 'date'
require File.join(File.dirname(__FILE__), 'B64/trollop.rb')
require File.join(File.dirname(__FILE__), 'B64/version.rb')
require File.join(File.dirname(__FILE__), 'B64/trollopoptions.rb')
require File.join(File.dirname(__FILE__), 'B64/B64options.rb')
# Base64 encoder/decoder to/from file
class B64File
  include TrollopOptions
  include B64options
  def initialize
    trollop_options
    program_options
  end

  def time
    @time = Time.now.strftime('%Y-%m-%d_%H-%M-%S').to_s
  end
end
B64File.new
