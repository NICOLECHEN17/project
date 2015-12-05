class UsersController < ApplicationController
  def show 
  	@user = User.find(params[:id])
     @microposts = @user.microposts 
  end

  def new
  	@user = User.new
  end
 
def create
        secure_params = params.require(:user).permit(:name, :email, 
                                  :password, :password_confirmation)
        @user = User.new(secure_params)
        if @user.save
          remember @user
        	flash[:success] = "Welcome to the Sample App!"  
           redirect_to @user # Handle a successful save.
        else
            render 'new'  # Handle an unsuccessful save.     
        end
      end

       def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      # Handle a successful update.
    else
      render 'edit'
    end
  end




  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end

end

