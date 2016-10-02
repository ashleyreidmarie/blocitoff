class Item < ActiveRecord::Base
  belongs_to :user
  
  validates :name, length: { minimum: 5 }, presence: true
  validates :user, presence: true
  
end
