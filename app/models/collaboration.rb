class Collaboration < ActiveRecord::Base
  validates :user_id, presence: true
  validates :wiki_id, presence: true
  belongs_to :wiki
  belongs_to :user

end
