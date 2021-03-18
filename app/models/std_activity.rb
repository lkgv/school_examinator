class StdActivity < ApplicationRecord
    belongs_to :exam_item
    has_many :activities

    def expr
      "#{self.description} （#{self.score} 分） "
    end
end
