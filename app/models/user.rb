class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  validates :username, presence: true
  validates :username, uniqueness: true
  has_many :wikis

  def role?(base_role)
    role == base_role.to_s
  end

  def set_premium
    update_attribute(:premium, true)
  end
end





