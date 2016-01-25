class UserResult < ActiveRecord::Base
    belongs_to :user
    belongs_to :quiz
    validates :user_id, presence: true
end
