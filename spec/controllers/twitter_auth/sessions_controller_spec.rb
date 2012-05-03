require 'spec_helper'

describe TwitterAuth::SessionsController do

  describe "GET 'new'" do
    context "authenticated" do
      it "should redirect to return_to" do
        
      end
    end
    
    context "unauthenticated" do
      it "should redirect to /twitter_auth/twitter" do
        get :new
        response.should redirect_to("/twitter_auth/twitter")
      end
    end
  end
  
  describe "GET 'create'" do
    context "unauthenticated" do
      context "valid params" do
        before(:each) do
          request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:twitter]
        end
        
        it "should authenticate given user" do
          user = create(:user, :matt)
          get :create
          controller.current_user.should eq(user)
        end
        
        context "new user" do
          it "should create new user" do
            expect {
              get :create
            }.should change(User, :count).by(1)
          end
        end
        
        context "return_to is empty" do
          it "should redirect to /" do
            session.delete :return_to
            get :create
            response.should redirect_to("/")
          end
        end
        
        context "return_to is present" do
          it "should redirect to return_to" do
            session[:return_to] = "/bar"
            get :create
            response.should redirect_to("/bar")
          end
        end
      end
    end    
  end

end