class SessionsController < Devise::SessionsController
    before_action :destroy_user, only: :destroy
    protected 
    def destroy_user
      #unless Rails.env.development?
        if current_user.email=="diccet2021@diver.jp"
          current_user.destroy    
      end
      #end 
    end
end