class Order < ActiveRecord::Base
  belongs_to :coffee
  belongs_to :customer
  
  def receipt
    puts "#{customer.name} ordered a #{coffee.title} for $#{price}"
  end


  # def self.most_expensive
  #   all.maximum(:price)
  # end

end