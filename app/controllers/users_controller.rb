class UsersController < ApplicationController

  def index
    @friends = current_user.friends
    @nonfriends = User.all - @friends
  end

  def show
    @user = User.find(params[:id])
    @hangouts = Hangout.all.select do |h| h.owner == current_user end
    @invitations = Invitation.all.select do |i| i.guest == @user && i.confirmed == false end
  end

  def new
    @user = User.new
  end

  def create
    #i'm saving all usernames as downcase
    user_params[:username] = user_params[:username].downcase
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      redirect_to @user #i.e. user_path(@user)
    else
      flash[:error] = @user.errors.full_messages
      redirect_to new_user_path
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params) #same as - if valid? pretty sure .update will save ; not sure how else to do this
      redirect_to @user
    else
      flash[:error] = @user.errors.full_messages
      redirect_to edit_user_path(@user)
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
  end

private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :username, :password)
  end


end
