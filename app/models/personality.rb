class Personality < ActiveRecord::Base
    belongs_to :quiz
    has_many :quiz_options
    validates :name, presence: true
    validates :description, presence: true
    validates :quiz_id, presence: true
    validates_uniqueness_of :name, scope: :quiz_id
    validates_uniqueness_of :description, scope: :quiz_id
end
