class Project < ApplicationRecord
  belongs_to :team

  enum priority: { low: 0, medium: 1, high: 2, critical: 3 }
  enum status: { planning: 0, active: 1, on_hold: 2, done: 3 }

  has_many :tasks, dependent: :destroy
  has_many :project_memberships, dependent: :destroy
  has_many :responsibles, through: :project_memberships, source: :user

  scope :accessible_by, ->(user) { where(team: user.teams) }
end
