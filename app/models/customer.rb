class Customer < ActiveRecord::Base
  has_many :orders, dependent: :destroy
  has_many :coffees, through: :orders


  def self.names
    pluck(:name)
  end

  def order_coffee (coffee_title, price)
    coffee = coffees.find_by(title: coffee_title)
    order = Order.create(customer_id: self.id, coffee_id: coffee.id,  price: price)
    puts "#{order.receipt}"
  end

  def total_purchase_amount
    orders.sum(:price)
  end

  def dislike_coffee(coffee_title)
    coffee = Coffee.find_by(title: coffee_title)
    order = orders.where("coffee_id = ?", coffee.id).last.destroy
    # orders.order(id: :desc).find_by(coffee_id: coffee.id)
    puts "#{self.name} has been refunded #{order.price}"
  end

end