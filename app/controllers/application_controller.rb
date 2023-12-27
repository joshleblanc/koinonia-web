class ApplicationController < ActionController::Base
    include Pundit::Authorization
    after_action :verify_authorized, except: :index
    after_action :verify_policy_scoped, only: :index
    
    before_action :authenticate_user!
    skip_before_action :verify_authenticity_token, if: -> { request.content_type == "application/json" }

    def authenticate_user!
        authenticate_user_from_token! || super
    end

    def authenticate_user_from_token!
        User.find_by(token: user_token)
    end

    def user_token
        request.headers['X-AUTH-TOKEN'].presence || params['auth_token'].presence
    end
end
