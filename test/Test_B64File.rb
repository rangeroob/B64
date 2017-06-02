#! /usr/bin/env_ruby
require 'minitest/autorun'
require File.join(File.dirname(__FILE__), '../lib/B64')
# minitest test
class TestB64 < Minitest::Test
  def setup
    @b64 = B64File.new
    @b64.extend(B64options)
   # @b64.extend(trollopoptions)
  end

  def test_time_equals_time_right_now?
    @time = Time.now.strftime('%Y-%m-%d_%H-%M-%S').to_s
    assert_equal @time, @b64.time
  end

  def test_start_includes_add?
    assert_includes @b64.start, :add
  end
end
