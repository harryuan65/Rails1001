class ApplicationController < ActionController::API
  def test
    res = params.permit(*params.keys).to_h.each_with_object([]) do |(k, v), a|
      a << "#{k}: #{v}, type is #{v.class}"
    end
    render json:res
  end
end
