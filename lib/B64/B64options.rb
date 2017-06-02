# Options for Program
module B64options
  def program_options
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
