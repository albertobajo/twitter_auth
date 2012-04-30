class User < ActiveRecord::Base
  include TwitterAuth::User  
end
