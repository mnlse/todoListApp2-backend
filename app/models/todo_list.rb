class TodoList < ApplicationRecord
  validates :name, presence: true

  belongs_to :team
  has_many :todo_list_items, dependent: :destroy
end
