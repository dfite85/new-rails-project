class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Pundit                                                                #ok.. i did what it told me to do but it tells me i am in error here

  protect_from_forgery with: :exception
end


