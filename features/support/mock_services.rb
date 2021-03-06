require 'webmock/cucumber'

include WebMock::API

class MockRestService
  STANDARD_HEADERS = { 'Accept' => '*/*', 'User-Agent' => 'Ruby' }
  STANDARD = 'http'
  SECURE = 'https'

  def initialize(host, port, protocol = STANDARD)
    @protocol = protocol
    @host = host
    @port = port
    @messages = {}
  end

  def allow_connections
    WebMock.allow_net_connect!
  end

  def store_msg(type, path, message, headers = {}, user = nil, password = nil, code = 200)
    new_headers = STANDARD_HEADERS.merge(headers)
    auth_string = "#{user}:#{password}@" unless user.nil? && password.nil?
    WebMock.stub_request(type.downcase.to_sym, "#{@protocol}://#{auth_string}#{@host}:#{@port}#{path}")
      .with(headers: new_headers)
      .to_return(status: code.to_i, body: "#{message}", headers: {})
  end

  def store_get_query(path, headers = {}, user = nil, password = nil)
    new_headers = STANDARD_HEADERS.merge(headers)
    params = {}
    message = path.split('?').last
    auth_string = "#{user}:#{password}@" unless user.nil? || password.nil?
    WebMock.stub_request(:get, "#{@protocol}://#{auth_string}#{@host}:#{@port}#{path}")
      .with(headers: new_headers)
      .to_return({ body: "#{message}", status: 200 }, headers: {})
  end

  def get_last_request
    WebMock::RequestRegistry.instance.to_s
  end
end
