class Personality < ActiveRecord::Base
    belongs_to :quiz
    validates :name, presence: true
    validates :description, presence: true
    validates :quiz_id, presence: true
    validates_uniqueness_of :name, scope: :quiz_id
    validates_uniqueness_of :description, scope: :quiz_id
    has_attached_file :image, styles: {medium: "300x300>", thumb: "150x150>"}, default_url: "/images/:style/:filename"
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
    validates :image, presence: true
    
    def image_med_url
      image.url(:medium)    
    end
end
