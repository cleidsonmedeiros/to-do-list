class Task < ApplicationRecord

    validate :due_date_cannot_be_in_the_past
    belongs_to :owner, class_name: 'User' 

    after_save :is_expired

    def due_date_cannot_be_in_the_past
        if due_date.present? && due_date < Date.today
          errors.add(:due_date, "can't be in the past")
        end
    end

    def is_expired
      if self.due_date < Date.today
        self.status = 'expired'
        self.save
      end
    end
end
