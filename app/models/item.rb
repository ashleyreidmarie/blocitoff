class Item < ActiveRecord::Base
  belongs_to :user
  
  validates :name, length: { minimum: 2 }, presence: true
  validates :user, presence: true
  
  default_scope { order('created_at') } 
  scope :completed, ->{where(completed: true)}
  scope :uncompleted, ->{where(completed: false)}
  
end
