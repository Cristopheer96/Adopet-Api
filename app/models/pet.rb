class Pet < ApplicationRecord
  validates :size, presence: true
  validates :gender, presence: true
  validates :coatsize, presence: true
  validates :state, presence: true
  validates :ubication, presence: true
  validates :age, presence: true

  belongs_to :owner
end
