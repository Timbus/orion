require "http/server"

# :nodoc:
class Orion::Handlers::MethodOverrideParam
  include HTTP::Handler

  def call(cxt : HTTP::Server::Context)
    request = cxt.request
    override_method = param_method?(request)
    request.method = override_method if override_method
    call_next cxt
  end

  private def param_method?(req : HTTP::Request)
    req.query_params["_method"]?
  end
end
