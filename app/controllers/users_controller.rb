class UsersController < ApplicationController
  def index
    @users = User.order(:created_at => :desc)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to users_path, :notice => "Updated user successfully"
    else
      render :edit
    end
  end

  def notify
    @user = User.find(params[:user_id])

    notifier = NotifierRegistry.notifier_for(@user.notification_method)
    notifier.new.deliver(@user, :welcome)

    redirect_to users_path, :notice => "Notification sent"
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :notification_method)
  end
end
