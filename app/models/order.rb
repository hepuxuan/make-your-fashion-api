class Order < ApplicationRecord
  belongs_to :user
  has_many :order_item
  enum status: [ :incart, :placed ]
  def as_json(options={})
    options[:include] ||= [ :order_item ]
    super(options)
  end
end
