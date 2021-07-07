desc "Giving discount of 10rs for order above 500"
task :give_offers => :environment do
  orders=Order.where("amount>500")

  orders.each do |order|
    order.update(amount:(order.amount-10))
    puts "test #{order.amount}"
  end 
end