class Book < ActiveRecord::Base
  has_many :memos
  validates :title, :presence => true, :length => { :maximum => 256 }
  scope :this_month, lambda{ where(:updated_at => (Time.now.beginning_of_month)..(Time.now)) }
end
