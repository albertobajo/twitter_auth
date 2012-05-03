# encoding: UTF-8

require "active_model"
require "active_support"

module TwitterAuth
  module User
    extend ActiveSupport::Concern

    included do
      serialize :user_info, TwitterAuth::Hash
      
      include Validations
    end
    
    module Validations
      extend ActiveSupport::Concern
      include ActiveModel::Validations
      
      included do
        validates_presence_of :uid
        validates_uniqueness_of :uid
      
        validates_presence_of :token_key
        validates_presence_of :token_secret
        validates_presence_of :user_info
      end
    end

    module ClassMethods
      def find_or_create_by_auth_hash(auth_hash)
        user = find_or_initialize_by_uid(auth_hash[:uid])
        user.token_key = auth_hash[:credentials][:token]
        user.token_secret = auth_hash[:credentials][:secret]
        user.user_info = TwitterAuth::Hash.new(auth_hash[:extra][:raw_info])
        user.save!
        
        user
      end
    end
    
    def method_missing(method, *args, &block)
      self[:user_info].send(method.to_s)
    rescue NoMethodError
      super
    end
    
    def respond_to?(sym, include_private = false)
      (self[:user_info].respond_to? sym) ? true : super(sym, include_private)
    end

  end
  
end