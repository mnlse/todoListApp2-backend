class Team < ApplicationRecord
  validates :name, presence: true
  has_many :todo_lists, dependent: :destroy
end
