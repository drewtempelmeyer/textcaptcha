require "textcaptcha/configuration"
require "textcaptcha/version"
require "digest/md5"
require "httparty"

module Textcaptcha
  # The API URL for textcaptcha
  URL = 'http://api.textcaptcha.com/'

  class << self
    attr_accessor :configuration

    # Configure variables. See Textcaptcha::Configuration
    def configure
      self.configuration ||= Configuration.new
      yield configuration
    end

    # Obtain the question and answer(s). Returns a hash with the question and answers. The answers are MD5 hashed values to be checked after submission.
    #
    # Textcaptcha.obtain # => { :question => "What's eight - 7?", :answers => [ "c4ca4238a0b923820dcc509a6f75849b", "f97c5d29941bfb1b2fdab0874906ab82" ] }
    def obtain
      api_response = HTTParty.get(URL << self.configuration.api_key)
      answers = api_response['captcha']['answer'].is_a?(String) ? [ api_response['captcha']['answer'] ] : api_response['captcha']['answer']
      { :question => api_response['captcha']['question'], :answers => answers }
    end
    alias :get :obtain

    # Returns true if the answer is valid.
    #
    # == Parameters
    # * <tt>answer</tt> - The answer provided by the user.
    # * <tt>answers</tt> - The possible correct answers returned from <tt>obtain</tt>.
    def valid?(answer, answers)
      answers.include?(Digest::MD5.hexdigest(answer.to_s.lstrip.rstrip))
    end

  end

end
