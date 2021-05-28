class Project < ApplicationRecord
  has_many :tasks
  belongs_to :user

  def badge_color
    case status
    when 'Não iniciado'
      'secondary'
    when 'Em progresso'
      'info'
    when 'Concluído'
      'success'
    end
  end

  def status
    return 'Não iniciado' if tasks.none?

    if tasks.all? { |task| task.complete? }
      'Concluído'
    elsif tasks.any? { |task| task.in_progress? || task.complete? }
      'Em progresso'
    else
      'Não iniciado'
    end
  end

  def percent_complete
    return 0 if tasks.none?
    ((total_complete.to_f / total_tasks) * 100).round
  end

  def total_complete
    tasks.select { |task| task.complete? }.count
  end

  def total_tasks
    tasks.count
  end
end
