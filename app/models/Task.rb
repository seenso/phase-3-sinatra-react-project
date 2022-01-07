class Task < ActiveRecord::Base
    belongs_to :household
    belongs_to :user
    belongs_to :pet

    def my_date 
        due_date = self.task_due_date
        due_date.to_formatted_s(:short)
      end
end