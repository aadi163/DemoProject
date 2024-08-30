class OrderItemMailer < ApplicationMailer
  default from: "adrathore@bestpeers.com"

  def order_item_email(current_user , product)
    @user = current_user
    @product = product
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
