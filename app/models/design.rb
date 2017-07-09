class Design < ApplicationRecord
  has_and_belongs_to_many :tags
  def as_json(options={})
     options[:except] ||= [:created_at, :updated_at]
     super(options)
   end
end
