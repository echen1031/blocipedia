class Wiki < ActiveRecord::Base
  belongs_to :user  
  validates :name, presence: true
  validates :user_id, presence: true

  scope :public, lambda{ where ({:public => true}) }
  scope :private, lambda{ where ({:public => false}) }
  has_many :collaborations, :class_name => "Collaboration"
  has_many :collaborators, :class_name => "user", :through => :collaboration
end
