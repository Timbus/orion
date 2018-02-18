# :nodoc:
struct Orion::Middleware::Meta
  include Middleware

  def call(cxt : HTTP::Server::Context, chain)
    chain.call cxt
    cxt.response.headers["Content-Type"] ||= "text/html"
    cxt.response.headers["X-Powered-By"] ||= "Orion"
  end
end
