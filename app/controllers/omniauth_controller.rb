class OmniauthController < ApplicationController
    require 'net/http'

    def github
        response = Net::HTTP.post_form('https://github.com/login/oauth/access_token', client_id => Rails.application.credentials.fetch(:client_id), client_secret => Rails.application.credentials.fetch(:client_secret), code => params[:code])
        p response
        redirect_to "https://sample-devise-omniauth.netlify.app/"
    end

end

# class Api::V1::OmniauthController < ApplicationController
#     def github
#         p params

#         render json: params
#     end
# end
