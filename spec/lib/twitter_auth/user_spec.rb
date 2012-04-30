# encoding: UTF-8

require 'spec_helper'

class User
  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations  
  include TwitterAuth::User
    
  attr_accessor :uid, :token_key, :token_secret
  attr_writer :user_info
    
end

describe TwitterAuth::User do
  let(:user) { User.new }
  
  describe "uid" do
    it { user.should respond_to(:uid) }
    it { user.should validate_presence_of(:uid) }
  end
  
  describe "token_key" do
    it { user.should respond_to(:token_key) }
    it { user.should validate_presence_of(:token_key) }
  end
  
  describe "token_secret" do
    it { user.should respond_to(:token_secret) }
    it { user.should validate_presence_of(:token_secret) }
  end
    
  describe "user_info=" do
    it { user.should respond_to(:user_info=) }
  end
  
  describe "user_info method access" do
    describe "user.a.b" do
      before(:each) do
        user.user_info = TwitterAuth::Hash.new ({ a: { b: 3 } })
      end
      
      it { user.should respond_to(:a) }
      it { user.a.should respond_to(:b) }
      it { user.a.b.should eq(3) }
      
      it "should raise NoMethodError" do
        expect {
          user.b
        }.should raise_error(NoMethodError)
      end
      
    end
  end
end
