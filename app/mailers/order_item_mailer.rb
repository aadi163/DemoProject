class OrderItemMailer < ApplicationMailer
  default from: "adrathore@bestpeers.com"

  def order_item_email(current_user)
    @user = current_user
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
