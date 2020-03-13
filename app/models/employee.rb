class Employee < ApplicationRecord
  belongs_to :department
  has_many :tasks, dependent: :destroy


  def average_performance
    @tasks = self.tasks
    score = 0
    @tasks.each do |task|
      if task.performance
        score += task.performance
      end
    end
    return score
  end
end
