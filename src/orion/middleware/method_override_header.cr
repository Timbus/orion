require "http/server"

# :nodoc:
struct Orion::Middleware::MethodOverrideHeader
  include Middleware

  def call(cxt : HTTP::Server::Context, chain)
    override_method = cxt.request.headers["x-method-override"]?
    cxt.request.method = override_method if override_method
    chain.call cxt
  end
end
