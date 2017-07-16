class Product < ApplicationRecord
  has_many :design_detail
  has_many :text_detail
  def as_json(options={})
    options[:except] ||= [:created_at, :updated_at]
    super(options)
  end
end
