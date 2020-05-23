class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :calendar
  has_many :members, dependent: :destroy
  accepts_nested_attributes_for :members
end
