class Api::V1::PostsController < Api::V1::BaseController

    before_action :authenticate_user
    before_action :authorize_user

    def update
    end
    
    def create
    end

    def destroy
    end
end
