class QuestionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def quiz?
    true
  end

  def results?
    true
  end
end
