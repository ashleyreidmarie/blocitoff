class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :lockable
  
  has_many :items
  
  before_save { self.name = self.name.capitalize }       
         
  validates :name, length: { minimum: 2, maximum: 35 }, presence: true, format: {message: 'Names cannot contain special characters.', without: /[@\\\/+*?\[^\]$(){}=!<>|:]/}
  
         
end
