module WikisHelper
    def permissions
        current_user.role == 'premium' || current_user.role == 'admin'
    end
end
