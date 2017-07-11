# This is a constructor class for orders
class Order
  attr_reader :status, :datetime

  def initialize(attributes)
    @status         = attributes[:status]
    @datetime       = attributes[:datetime]
  end
end
