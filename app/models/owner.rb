class Owner < ApplicationRecord
  validates :phonenumber, presence: true

  has_many :pets, dependent: :destroy
  belongs_to :user
end
