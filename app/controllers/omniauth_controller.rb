class OmniauthController < ApplicationController
    def github
        p params

        render json: params
    end
end

# class Api::V1::OmniauthController < ApplicationController
#     def github
#         p params

#         render json: params
#     end
# end
