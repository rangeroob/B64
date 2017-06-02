#! /usr/bin/env_ruby
require 'minitest/autorun'
require File.join(File.dirname(__FILE__), '../lib/B64')
# minitest test
class TestB64 < Minitest::Test
  include B64options
  include TrollopOptions
  def setup
    @b64 = B64File.new
  end

  def test_time_equals_time_right_now?
    @time = Time.now.strftime('%Y-%m-%d_%H-%M-%S').to_s
    assert_equal @time, @b64.time
  end

  def test_encode_is_vaild?
    assert true, @b64.encode
  end

  def test_encode_writes_to_file?
    write = @b64.encode('hello')
    assert_equal write, @time
    # clean up file
    File.delete(Time.now.strftime('%Y-%m-%d_%H-%M-%S'))
  end

  def test_decode_file_nonexistent?
    assert_raises(TypeError) { @b64.decode }
  end

  def test_decode_if_file_exists?
    read = ['aSB3YW50IGEgY3JhY2tlciE=']
    testfile = File.join(File.dirname(__FILE__), '../test/file/test.txt')
    assert_equal read, @b64.decode(testfile)
  end

  def test_delete_is_vaild?
    File.new 'delete', 'w'
    delete = @b64.delete('delete')
    assert true, delete
  end
end
