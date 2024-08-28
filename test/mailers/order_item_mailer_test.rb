require "test_helper"

class OrderItemMailerTest < ActionMailer::TestCase
  test "order_item_email" do
    mail = OrderItemMailer.order_item_email
    assert_equal "Order item email", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
