class Employee < ApplicationRecord
  belongs_to :department
  has_many :tasks, dependent: :destroy
end
