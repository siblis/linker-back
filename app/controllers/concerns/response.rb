module Response
  def json_response(object, status = 504)
    render json: { message: object, status: status }
  end
end
