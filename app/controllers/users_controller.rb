 class UsersController < ApplicationController
  
  def  show
    #@user=User.find_by_email("sukesh@futurenow.biz")
     #@user=User.find("3")
     @user=User.find(params[:id])
  end
  def new
  	@title="Sign up"
  end
  
end 
