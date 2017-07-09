class User < ApplicationRecord
  has_many :order
  has_secure_password
  validates :phone, presence: true, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }, if: :password
  def as_json(options={})
     options[:except] ||= [:created_at, :updated_at, :password, :password_confirmation, :password_digest]
     super(options)
   end
end
