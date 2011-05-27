 class UsersController < ApplicationController
  def new
  	@title="Sign up"
  end
  def  show
    #@user=User.find_by_email("sukesh@futurenow.biz")
     #@user=User.find("3")
     @user=User.find(3)
  end
end
