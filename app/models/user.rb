class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: [:admin, :client]

  has_many :class_orgs, dependent: :destroy
         
  def admin?
    self.role == "admin"
  end

  def role_cn
    { admin: "管理员", client: "用户" }[self.role.to_sym]
  end
  
end
