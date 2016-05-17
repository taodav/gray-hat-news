class Post < ActiveRecord::Base
  has_many :comments, class_name: 'Note'
  has_many :votes, as: :point
  belongs_to :user

  validates :title, length: { in: 2..150 }
  validates :title, :body, presence: true
end
