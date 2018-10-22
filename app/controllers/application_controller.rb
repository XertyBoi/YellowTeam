class ApplicationController < ActionController::Base
  before_action :set_user, :user_id

  def set_user
    unless (!cookies[:user_id].nil?)
      cookies[:user_id] = {
       :value => rand(10000..99999)
       }
    end
  end

  def user_id
    @user_id = cookies[:user_id]
  end

end
