class OrderItemMailer < ApplicationMailer
  default from: "from@example.com"

  def order_item_email
    @user = params[:user]
    @order_item = params[:order_item]
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
