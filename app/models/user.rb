class User < ApplicationRecord
  has_secure_password
  enum role: { member: 0, admin: 1 }

  has_many :team_memberships, dependent: :destroy
  has_many :teams, through: :team_memberships

  has_many :project_memberships, dependent: :destroy
  has_many :projects, through: :project_memberships

  has_many :task_assignments, dependent: :destroy
  has_many :tasks, through: :task_assignments
end
