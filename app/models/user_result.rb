class UserResult < ActiveRecord::Base
    belongs_to :user
    belongs_to :quiz
    belongs_to :personality
    validates :user_id, presence: true
end
