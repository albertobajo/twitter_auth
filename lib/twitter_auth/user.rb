# encoding: UTF-8

require "active_model"
require "active_support"

module TwitterAuth
  module User
    extend ActiveSupport::Concern
    include ActiveModel::Validations

    included do
      attr_accessor :user_info
      validates_presence_of :uid, :token_key, :token_secret
      validates_uniqueness_of :uid
    end

    module ClassMethods
      def find_or_create_by_auth_hash(auth_hash)
        u = self.find_or_initialize_by_uid(auth_hash[:uid])
        u.token_key = auth_hash[:credentials][:token]
        u.token_secret = auth_hash[:credentials][:secret]
        u.save!
      end
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