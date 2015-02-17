module Users
 class UserController < ApplicationController
 
  before_action :find_user, except: [:index, :destroy]
 def index
    @users = User.includes(:roles).all
 end

  def edit
  end
  
  def set_admin
    @user.roles.create(role: "admin") 
    redirect_to users_user_index_path
  end
  
  def set_moderator
    @user.roles.create(role: "moderator") 
    redirect_to users_user_index_path
  end

  def destroy
    @user = User.find(params[:id])
    @user.roles.first.destroy
    redirect_to users_user_index_path
  end
  
  def set_tags
    case params[:key]
     when "marked"
     @user.tag_list.add(params[:id])
     when "unmarked"
     @user.tag_list.remove(params[:id])
    end
    @user.save
    @list_tag = @user.tag_list
    render partial: "user" 
  end

 def show
  @user = User.find(params[:id])
  @tags = ActsAsTaggableOn::Tag.all
  @list = @user.tag_list
  end

  private
  
  def find_user
    @user = User.find(params[:user_id]) if params[:user_id]
  end

 end
end

