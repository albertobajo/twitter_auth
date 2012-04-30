# encoding: UTF-8

require "active_model"
require "active_support"

module TwitterAuth
  module User
    extend ActiveSupport::Concern
    include ActiveModel::Validations

    included do
      validates_presence_of :uid, :token_key, :token_secret
    end

    module ClassMethods
    end
    
    def method_missing(method, *args, &block)
      @user_info.send(method.to_s)
    rescue NoMethodError
      super
    end
    
    def respond_to?(sym, include_private = false)
      (@user_info.respond_to? sym) ? true : super(sym, include_private)
    end

  end
  
end