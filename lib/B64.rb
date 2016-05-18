#! /usr/bin/env_ruby
require 'base64'
require 'date'
require File.join(File.dirname(__FILE__), 'B64/trollop.rb')
require File.join(File.dirname(__FILE__), 'B64/version.rb')
# Base64 encoder/decoder to/from file
class B64File
  def initialize
    start
    opts
  end

  def time
    @time = Time.now.strftime('%Y-%m-%d_%H-%M-%S').to_s
  end

  def start
    sub_commands = %w(file)
    @opts = Trollop.options do
      opt :write, 'write file', type: :string
      opt :read, 'read file', type: :string
      opt :delete, 'delete file', type: :string
      stop_on sub_commands
    end
    cmd = ARGV.shift
    cmd_opts = case cmd
      when "file"
        Trollop::options do
          opt :add, "Add to File", type: :string
  end
          
puts "Global options: #{global_opts.inspect}"
puts "Subcommand: #{cmd.inspect}"
puts "Subcommand options: #{cmd_opts.inspect}"
puts "Remaining arguments: #{ARGV.inspect}"
  end

  def opts
    if @opts[:write]
      encode
    elsif @opts[:read]
      decode
    elsif @opts[:delete]
      delete
    else
      :die
    end
  end

  def encode(file = @opts[:write])
    unless File.zero?(time)
      @encode = Base64.urlsafe_encode64(file.to_s)
      open(time.to_s, 'w') { |w| w.write(@encode.to_s) }
      return File.delete(time) if File.zero?(time)
    end
  end

  def delete(file = @opts[:delete])
    File.delete(file)
  end

  def decode(file = @opts[:read])
    open(file).readlines.each do |line|
      @decode = Base64.urlsafe_decode64(line)
      puts @decode
    end
  end
  end
end
B64File.new
