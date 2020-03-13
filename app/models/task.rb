class Task < ApplicationRecord
  belongs_to :employee
  belongs_to :business_process

  scope :active, -> { where("completed == false")}
  scope :withinOneWeek, -> { where ("created_at > ?", 7.days.ago)}
  scope :monthly, -> { where ("created_at > ?", DateTime.now.beginning_of_month)}
  scope :after, ->(comparator) { where ("created_at > ?", comparator)}
  scope :employee, ->(employee_id) { where("employee_id = ?", employee_id)}
end
