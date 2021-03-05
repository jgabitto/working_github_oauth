class OmniauthController < ApplicationController
    def github
        p new_client.auth_code
        access_token = new_client.auth_code.get_access_token(params[:code], :redirect_uri => "https://sample-devise-omniauth.netlify.app/#{access_token.token}")
        p access_token.token
        redirect_to "https://sample-devise-omniauth.netlify.app/#{access_token.token}"
    end

    private

    def new_client
        OAuth2::Client.new(Rails.application.credentials.fetch(:client_id), Rails.application.credentials.fetch(:client_secret), :site => 'https://github.com',
          :authorize_path => '/login/oauth/authorize', :access_token_path => '/login/oauth/access_token')
    end
end

# class Api::V1::OmniauthController < ApplicationController
#     def github
#         p params

#         render json: params
#     end
# end
