class Wiki < ActiveRecord::Base
  belongs_to :user  
  validates :name, presence: true
  validates :user_id, presence: true

  belongs_to :user

  scope :public, lambda{ where ({:public => true}) }
  scope :private, lambda{ where ({:public => false}) }
  has_many :collaborations
  has_many :collaborators, :class_name => "user", :through => :collaborations
end
