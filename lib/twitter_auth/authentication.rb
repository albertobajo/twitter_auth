module TwitterAuth
  module Authentication
    extend ActiveSupport::Concern

    included do
      helper_method :current_user
    end

    # Finds user from session.
    #
    # @return [User, nil]
    def current_user
      @current_user ||= ::User.find_by_uid(session[:uid])
    end

    # Stores request url and redirects user to twitter 
    # if its not authenticated.
    #
    # @example
    #   before_filter :require_user
    def require_user
      unless current_user.present?
        store_location
        redirect_to "/twitter_auth/twitter"
      end
    end

    # Redirects to after_create_url if user is authenticated
    #
    # @example
    #   before_filter :require_no_user
    def require_no_user
      redirect_to after_create_url if current_user.present?
    end

    # Redirects to the url stored or url provided if no stored.
    # Clears stored location after redirection.
    #
    # @param [String] default url to redirect if there isn't any other stored
    #
    # @example
    #   redirect_back_or("/user/profile")
    def redirect_back_or(default)
      redirect_to stored_location || default
      clear_return_to
    end

    # Sign user in to session.
    #
    # @param [User] user
    #
    # @example
    #   sign_in(@user)
    def sign_in(user)
      session[:uid] = user.uid
    end

    # Returns true if user is authenticated and returns false otherwise.
    def signed_in?
      session[:uid].present?
    end

    protected

      def store_location
        if request.get?
          session[:return_to] = request.fullpath
        end
      end

      def stored_location
        session[:return_to]
      end

      def clear_return_to
        session.delete :return_to
      end
  end
end