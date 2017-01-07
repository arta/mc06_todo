class TodoItem < ApplicationRecord
  belongs_to :todo_list

  def completed?
    completed_at?
  end

  def destroy
    return false if completed?
    super
  end
end
