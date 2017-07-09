class OrderItem < ApplicationRecord
  belongs_to :order
  def as_json(options={})
    options[:except] ||= [:created_at, :updated_at]
    super(options)
  end
end
