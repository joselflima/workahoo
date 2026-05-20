class Task < ApplicationRecord
  belongs_to :project

  enum priority: { low: 0, medium: 1, high: 2, critical: 3 }
  enum status: { planning: 0, active: 1, on_hold: 2, done: 3 }

  has_many :task_assignments, dependent: :destroy
  has_many :responsibles, through: :task_assignments, source: :user

  scope :accessible_by, ->(user) { joins(:project).merge(Project.accessible_by(user)) }
end
