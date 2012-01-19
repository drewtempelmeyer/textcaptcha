require "test/unit"
require "textcaptcha"

class Test::Unit::TestCase
	def setup
		Textcaptcha.configure do |config|
			config.api_key = '7k7mhd0r3ack4gkwwsg8o0g0k9hk1abi'
		end
	end
end

