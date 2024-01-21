class ApplicationController < ActionController::Base
    include Pundit::Authorization
    # after_action :verify_authorized, except: :index
    # after_action :verify_policy_scoped, only: :index
    
    before_action :authenticate_user!
    skip_before_action :verify_authenticity_token

    def authenticate_user!
        if doorkeeper_token 
            Rails.logger.info "Authenticating with doorkeeper, #{doorkeeper_token.resource_owner_id}"
            User.find(doorkeeper_token.resource_owner_id)
        else
            Rails.logger.info "Authentication with devise"
            super
        end
    end

    def current_user
        @current_user ||= if doorkeeper_token
                            User.find(doorkeeper_token.resource_owner_id)
                          else
                            warden.authenticate(scope: :user)
                          end
      end
end
