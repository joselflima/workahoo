json.extract! project, :id, :team_id, :name, :goal, :deadline, :priority, :status, :created_at, :updated_at
json.url project_url(project, format: :json)
