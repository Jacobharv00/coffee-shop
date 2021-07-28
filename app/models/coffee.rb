class Coffee < ActiveRecord::Base
  has_many :orders, dependent: :destroy
  has_many :customers, through: :orders

  def unique_customer_names
    customers.pluck(:name).uniq
    # customers.distinct.pluck(:name)
  end

  def self.most_ordered
    # this is a ruby enumerable
    includes(:orders).all.max_by {|coffee| coffee.orders.length} 
    # active record method
    # Order.select('id, coffee_id, count(coffee_id) as coffee_order_count').group('coffee_id').order(coffee_order_count: :desc).first.coffee
  end

end