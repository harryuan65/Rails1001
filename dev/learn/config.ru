# Take 1
# run Proc.new { |env| [200, {'Content-Type' => 'text/html; charset=utf-8'}, ["安安我是哈利"]]}

# Take 2
# def app(env)
#   [200, {'Content-Type' => 'text/html; charset=utf-8'}, ["安安我不是哈利"]]
# end

# run method(:app)


# Take 3
# class App
#   def call(env)
#     [200, {'Content-Type' => 'text/html; charset=utf-8'}, ["安安我是 App"]]
#   end
# end

# run App.new


# Take 4
require 'json'
class MyMiddleware
  def initialize(app)
    @app = app
  end

  def call(env)
    @type = env['Content-Type']
    status, headers, body = @app.call(@env)
    body << "<br>你剛剛打的請求\n<pre>#{JSON.pretty_generate(env)}</pre>"
    [status, headers, body]
  end
end

use MyMiddleware
run Proc.new {|env| [200, {'Content-Type'=>'text/html; charset=utf-8'}, ['我剛剛前面有放一個 middleware']] }