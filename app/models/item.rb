class Item < ActiveRecord::Base
  belongs_to :user
  
  validates :name, length: { minimum: 2 }, presence: true
  validates :user, presence: true
  
end
