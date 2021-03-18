class ClassOrg < ApplicationRecord
    validates :number, uniqueness: { scope: :grade, message: '该班级已存在' }
    belongs_to :user
    has_many :activities, dependent: :destroy

    after_create :add_user_score
    before_destroy :restore_user_score

    enum grade: [:freshman, :sophomore, :junior]

    def grade_cn
      { freshman: "高一",
        sophomore: "高二",
        junior: "高三"
      } [self.grade.to_sym]
    end

    def description
      "#{self.grade_cn} #{self.number} 班"
    end

    protected

    def add_user_score
      self.user.score += self.score
      self.user.save
    end

    def restore_user_score
      self.user.score -= self.score
      self.user.save
    end
end
