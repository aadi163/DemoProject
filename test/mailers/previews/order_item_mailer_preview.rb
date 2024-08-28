# Preview all emails at http://localhost:3000/rails/mailers/order_item_mailer
class OrderItemMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/order_item_mailer/order_item_email
  def order_item_email
    OrderItemMailer.order_item_email
  end

end
