class Post < ApplicationRecord
  validates_presence_of :title, :body
  validates :title, length: { minimum: 5 }
  
  belongs_to :user
end
