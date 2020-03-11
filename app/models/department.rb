class Department < ApplicationRecord
  has_many :employees, dependent: :destroy
  has_many :business_processes, dependent: :destroy
end
