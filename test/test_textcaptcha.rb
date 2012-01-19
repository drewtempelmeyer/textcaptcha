require "helper"
require "digest/md5"

class TestTextcaptcha < Test::Unit::TestCase

	def test_obtain
		response = Textcaptcha.obtain
		assert_equal false, response[:question].nil?
		assert_equal true, response[:question].length > 0
		assert_equal 'Array', response[:answers].class.to_s
		assert_equal true, response[:answers].length > 0
	end

	def test_valid?
		answers = [ Digest::MD5.hexdigest('three'), Digest::MD5.hexdigest('3') ]
		assert_equal false, Textcaptcha.valid?('four', answers)
		assert_equal false, Textcaptcha.valid?(4, answers)
		assert_equal true, Textcaptcha.valid?('three', answers)
		assert_equal true, Textcaptcha.valid?('3', answers)
		assert_equal true, Textcaptcha.valid?(3, answers)
	end

end

