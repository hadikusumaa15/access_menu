class UserController < ApplicationController
# the route /users will run the index method
        # and load the index.html.erb
        def index
            # @users = User.all
            @users = User.all.order('created_at DESC')
            # same as first line but sort in descending (DESC) order 
            # based on what time they were created
          end
        
          def new
              @user = User.new
          end
        
        
          def create
            @user = User.new(user_params)
            if @user.save
                UserMailer.registration_confirmation(@user).deliver
                flash[:success] = "Registration completed! CONFIRM YOUR EMAIL WKWKWK!"
              redirect_to @user
            else
              UserMailer.registration_confirmation(@user).deliver
              # redirect_to @user
              render 'new'
            end
          end

          def confirm_email
            user = User.find_by_confirm_token(params[:id])
            if user
                user.email_activate
                flash[:success]="WELCOME YOUR EMAIL HAS BEEN VERIFIED"
            else
                flash[:error]="error USER NONEXIST / UNVERIFIED"
                redirect_to root_url
            end
        end
        
        
          def show
            @user = User.find(params[:id])
          end
        
          def edit
            @user = User.find(params[:id])
          end
        
          def update
            @user = User.find(params[:id])
            if @user.update(user_params)
              redirect_to @user
            else
              render 'edit'
            end
          end
        
          def destroy
            @user = User.find(params[:id])
            @user.destroy
            redirect_to root_path
          end
        
          private
        
          def user_params
              # require the :user table
              # security mesure called 'strong params' where we must permit
              # the different attributes (:name, :description) that you 
              # want to allow to be written to our database
              params.require(:user).permit(:email, :role_id);
          end
end
