class Task < ApplicationRecord
  belongs_to :project

  validates :status, inclusion: { in: ['Não iniciada','Em progresso','Concluída']}

  STATUS_OPTIONS = [
    ['Não iniciada'],
    ['Em progresso'],
    ['Concluída']
  ]

  def badge_color
    case status
    when 'Não iniciada'
      'secondary'
    when 'Em progresso'
      'info'
    when 'Concluída'
      'success'
    end
  end

  def complete?
    status == 'Concluída'
  end

  def in_progress?
    status == 'Em progresso'
  end

  def not_started?
    status == 'Não iniciada'
  end
end
