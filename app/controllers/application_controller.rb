class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    case resource.role
    when 'customer'
      homepage_path
    when 'seller'
      sellerhome_path
    else
      homepage_path
    end
  end
end
