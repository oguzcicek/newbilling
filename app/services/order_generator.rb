#app/services/order_genarator.rb

class OrderGenerator

  class << self
    # Generate x random orders
    def generateRandomOrders count
      count.times do
        Order.create(company_id: PaymentMethod.all.sample.id, quantity: rand(1..100))
      end
    end
  end

end