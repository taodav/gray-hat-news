class Vote < ActiveRecord::Base
  belongs_to :point, polymorphic: true
  belongs_to :user
end
