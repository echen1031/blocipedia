class Wiki < ActiveRecord::Base
  belongs_to :user  
  validates :name, presence: true
  validates :user_id, presence: true

  scope :public, lambda{ where ({:public => true}) }
  scope :private, lambda{ where ({:public => false}) }
  has_many :collaborations, :class_name => "Sharedwiki"
  has_many :users, :through => :sharedwiki
end
