class ApplicationController < ActionController::Base
  protect_from_forgery
  before filter :authenticate_user!
end
