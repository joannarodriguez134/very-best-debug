class UsersController < ApplicationController

  def index
    matching_users = User.all
    @users = matching_users.order(:created_at)

    render(template: "users/all_users")
  end
  
  def show
    username = params.fetch("username")
    matching_users = User.where({ :username => username })
    @user = matching_users.at(0)

    render({ :template => "users/user_details"})
  end
  
  def create
    @user = User.new
    @user.username = params.fetch("query_username")
    if @user.valid?
      @user.save
      redirect_to("/users/#{@user.username}")
    else
      redirect_to("/users")
    end
  end
  
  def update
    user_id = params.fetch("user_id")
    matching_users = User.where({ :id => user_id })
    @user = matching_users.at(0)
    
    @user.username = params.fetch("query_username")
    if @user.valid?
      @user.save
      redirect_to("/users/#{@user.username}")
    else
      redirect_to("/users/#{@user.username}")
    end
  end

end
