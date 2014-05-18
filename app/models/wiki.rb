class Wiki < ActiveRecord::Base
  belongs_to :user  
  validates :name, presence: true

  scope :public, where(:public => true)
  scope :private, where(:public => false)
end
