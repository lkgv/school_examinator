class ExamItem < ApplicationRecord
    validates :name, uniqueness: { case_sensitive: false, message: "该考核项已存在" }

    has_many :std_activities, dependent: :destroy
    has_many :activities, dependent: :destroy
end
