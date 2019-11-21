class BaseService

  def error(message, http_status = nil)
    result = {
        message: message,
        status: :error
    }

    result[:http_status] = http_status if http_status
    result.to_json
  end

  def success(message, http_status = nil)
    result = {
        message: message,
        status: :created
    }

    result[:http_status] = http_status if http_status
    result.to_json
  end

end
