class Owner < ApplicationRecord
  validate :phonenumber, presence: true

  has_many :pets
  belongs_to :user
end
