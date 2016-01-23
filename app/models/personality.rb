class Personality < ActiveRecord::Base
    belongs_to :quiz
    has_many :quiz_options
    validates :name, presence: true
    validates :description, presence: true
    validates :quiz_id, presence: true
end
