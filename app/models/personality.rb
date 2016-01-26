class Personality < ActiveRecord::Base
    belongs_to :quiz
    has_many  :user_results
    validates :description, presence: true
    validates :low_range, presence: true
    validates :high_range, presence: true
    validates :quiz_id, presence: true
    validates :image, presence: true
    validates_uniqueness_of :description, scope: :quiz_id
    has_attached_file :image, styles: {medium: "300x300>", thumb: "150x150>"}, default_url: "/images/:style/:filename"
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
    
    def image_med_url
      image.url(:medium)    
    end
end
