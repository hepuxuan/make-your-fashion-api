class DesignDetail < ApplicationRecord
  belongs_to :design
  belongs_to :product
  def as_json(options={})
     options[:except] ||= [:created_at, :updated_at]
     super(options)
   end
end
