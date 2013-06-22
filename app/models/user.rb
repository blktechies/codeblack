class User < ActiveRecord::Base
  attr_accessible :email, :handle, :password, :real_name
end
