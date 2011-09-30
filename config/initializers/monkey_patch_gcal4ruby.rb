# Monkey patching GCal4Ruby authenticate method to take the auth token and email as params (instead of email and password and resolving the auth token)
module GCal4Ruby
  class Service < Base

    # auth_token string
    # email string
    def authenticate(auth_token, email)
      @auth_token = auth_token
      @account = email
      return true
    end

  end
end