require 'jwt'

before '/api/v1/shelters*' do
  protected_methods = ['POST', 'PUT', 'DELETE']
  if protected_methods.include?(request.request_method)
    auth_header = request.env['HTTP_AUTHORIZATION']

    if auth_header.nil? || !auth_header.start_with?('Bearer ')
      halt 403, json(error: 'Token JWT requerido')
    end

    token = auth_header.split(' ').last

    begin
      payload = JWT.decode(token, ENV['JWT_SECRET'], true, { algorithm: 'HS256' })
      request.env['jwt.payload'] = payload.first
    rescue JWT::DecodeError
      halt 403, json(error: 'Token inválido o expirado')
    end
  end
end
