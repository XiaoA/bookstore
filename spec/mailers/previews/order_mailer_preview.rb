# Preview all emails at http://localhost:3000/rails/mailers/order_mailer
class OrderMailerPreview < ActionMailer::Preview
  def notify_on_successful_order
    customer = Customer.Last
    order = Order.Last
    OrderMailer.notify_on_successful_order(customer, order)
  end
end
