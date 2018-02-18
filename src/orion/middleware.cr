module Orion::Middleware
  abstract def call(c : HTTP::Server::Context, chain : Middleware::Chain)

  def call(c : HTTP::Server::Context)
    call(c, Middleware::Chain.new)
  end
end

require "./middleware/*"
