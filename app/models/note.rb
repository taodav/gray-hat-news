class Note < ActiveRecord::Base
  has_many :replies, class_name: 'Note', foreign_key: 'comment_id'
  has_many :votes, as: :point
  belongs_to :post
  belongs_to :comment, class_name: 'Note'
  belongs_to :user

  validates :text, presence: true
end
