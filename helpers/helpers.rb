 def parsed_body
     json? ? JSON.parse(request.body.read) : {}
  end

  def json?
    request.content_type == 'application/json'
  end