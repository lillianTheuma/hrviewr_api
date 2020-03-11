class BusinessProcess < ApplicationRecord
  has_many :tasks
  belongs_to :department
end
