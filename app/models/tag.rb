class Tag < ApplicationRecord
  has_and_belongs_to_many :designs
  def as_json(options={})
    options[:except] ||= [:created_at, :updated_at]
    super(options)
  end
end
