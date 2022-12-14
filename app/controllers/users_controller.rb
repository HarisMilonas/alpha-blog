class UsersController < ApplicationController
    def new 
        @user = User.new
    end

    def edit
        @user = User.find(params[:id])
    end

    def show
        @user = User.find(params[:id])
        @articles = @user.articles      #giati thelw na deiksw sto show.hmlt.erb ta articles toy kathe user 
    end

    def update
     @user = User.find(params[:id])   
     if @user.update(user_params)
        flash[:notice] = "Your account information has been updated"
        redirect_to article_path
     else
        render 'edit'
     end
    end

    def create
        @user = User.new(user_params)
        if @user.save
            flash[:notice] = "Welcome to the Alpha blog #{@user.username} you have succesfully signed up!"
            redirect_to articles_path
        else
            render 'new'
        end
    end

    private
    def user_params
        params.require(:user).permit(:username, :email, :password)
    end
end