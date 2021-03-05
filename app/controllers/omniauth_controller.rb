class OmniauthController < ApplicationController
    def github
        p params

        redirect_to "https://sample-devise-omniauth.netlify.app/#{params[:code]}"
    end
end

# class Api::V1::OmniauthController < ApplicationController
#     def github
#         p params

#         render json: params
#     end
# end
