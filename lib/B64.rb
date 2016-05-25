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
    @opts = Trollop.options do
      opt :write, 'write to file', type: :string
      opt :read, 'read file', type: :string
      opt :delete, 'delete file', type: :string
      opt :add, 'add to file', type: :string
    end
  end

  def opts
    if @opts[:write]
      encode
    elsif @opts[:read]
      decode
    elsif @opts[:delete]
      delete
    elsif @opts[:add]
      add
    end
  end

  def add(file = @opts[:add])
    print '>'
    addition = gets.chomp
    @encode = Base64.urlsafe_encode64(addition)
    open(file, 'a+') { |a| a.puts "\n" + @encode.to_s }
  end

  def encode(file = @opts[:write])
    unless File.zero?(time)
      @encode = Base64.urlsafe_encode64(file.to_s)
      open(time.to_s, 'w+') { |w| w.write(@encode.to_s) }
      return File.delete(time) if File.zero?(time)
    end
  end

  def delete(file = @opts[:delete])
    File.delete(file)
  end

  def decode(file = @opts[:read])
    open(file).readlines.each do |line|
      @decode = Base64.decode64(line)
      puts @decode
    end
  end
end
B64File.new
