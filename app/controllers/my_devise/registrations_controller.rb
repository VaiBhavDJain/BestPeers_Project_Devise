class MyDevise::RegistrationsController < Devise::RegistrationsController
    
    def create
        if params[:user][:password] == params[:user][:password_confirmation]
            @user = User.new(user_params)
            if @user.save
                byebug
                redirect_to verification_mail_send_path(@user), notice: 'Thank you for signing up!'
            else
              render :new
            end
        else
            super
        end
    end

    private
    def user_params
        params.require(:user).permit(:name,:email,:password)
    end
end
