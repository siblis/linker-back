module Response
  def json_response(object, status = 504)
    render json: object, status: status
  end
end
