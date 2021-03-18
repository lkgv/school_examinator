class Activity < ApplicationRecord
    belongs_to :class_org
    belongs_to :exam_item
    belongs_to :std_activity

    after_create :deduct_class_org_score
    before_destroy :restore_class_org_score

    protected

    def deduct_class_org_score
      class_org = self.class_org
      user = class_org.user
      class_org.score += self.score
      class_org.save
      user.score += self.score
      user.save
    end

    def restore_class_org_score
      class_org = self.class_org
      user = class_org.user
      class_org.score -= self.score
      class_org.save
      user.score -= self.score
      user.save
    end

end
