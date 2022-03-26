class Pet < ApplicationRecord
  validate :size, presence: true
  validate :gender, presence: true
  validate :coatsize, presence: true
  validate :state, presence: true
  validate :ubication, presence: true
  validate :age, presence: true

  belongs_to :owner
end
