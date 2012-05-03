# encoding: UTF-8

require 'spec_helper'


describe TwitterAuth::User do
  subject { create(:user) }
  
  describe "uid" do
    it { should respond_to(:uid) }
    it { should validate_uniqueness_of(:uid) }
    it { should validate_presence_of(:uid) }
  end
  
  describe "token_key" do
    it { should respond_to(:token_key) }
    it { should validate_presence_of(:token_key) }
  end
  
  describe "token_secret" do
    it { should respond_to(:token_secret) }
    it { should validate_presence_of(:token_secret) }
  end
  
  describe "user_info" do
    it { should validate_presence_of(:user_info) }
  end
    
  describe "user_info=" do
    it { should respond_to(:user_info=) }
  end
  
  describe "user_info method access" do
    describe "user.a.b" do
      before(:each) do
        subject.user_info = TwitterAuth::Hash.new ({ a: { b: 3 } })
      end
      
      it { should respond_to(:a) }
      it { subject.a.should respond_to(:b) }
      it { subject.a.b.should eq(3) }
      
      it "should raise NoMethodError" do
        expect {
          subject.b
        }.should raise_error(NoMethodError)
      end
      
    end
  end
end

describe TwitterAuth::User, "find_or_create_by_auth_hash" do
  subject { User }
  let(:auth_hash) { OmniAuth.config.mock_auth[:twitter] }

  it { should respond_to(:find_or_create_by_auth_hash) }
  
  context "user exists" do    
    it "should not create an user" do
      create(:user, :matt)
      expect {
        User.find_or_create_by_auth_hash(auth_hash)
      }.should change(User, :count).by(0)
    end
  end
  
  context "new user" do
    it "should create a new user" do
      expect {
        User.find_or_create_by_auth_hash(auth_hash)
      }.should change(User, :count).by(1)
    end
  end
end
