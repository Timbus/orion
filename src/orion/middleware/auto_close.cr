require "http/server"

# :nodoc:
struct Orion::Middleware::AutoClose
  include Middleware

  def call(cxt : HTTP::Server::Context, chain)
    chain.call cxt
    cxt.response.close
  end
end
