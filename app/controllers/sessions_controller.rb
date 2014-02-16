class SessionsController < ApplicationController
def create
    user = User.find_by(badge: params[:session][:badge])
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_to user
    else
      flash.now[:error] = 'Invalid badge/password combination'
      render 'new'
    end
  end

end
