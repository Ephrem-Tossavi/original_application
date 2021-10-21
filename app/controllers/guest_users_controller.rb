class GuestUsersController < ApplicationController
    def login
        admin= false
        
        admin= true if params[:type].to_i==1
            
    user = User.new(name: "Emrys", email: "diccet2021@diver.jp", password: "password", status: "Etudiant", admin:admin )
    user.save!(validate: false)
    #user.skip_confirmation_notification!
    #user.confirm
    #user.skip_confirmation!
    sign_in user
    redirect_to root_path
end
end
