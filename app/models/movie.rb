class Movie < ActiveRecord::Base
	scope :duration, -> { where("runtime_in_minutes < ?", "90") }
	scope :duration, -> { where("runtime_in_minutes between ? and ?", "90", "120") }
	scope :duration, -> { where("runtime_in_minutes > ?", "120") }

	

	mount_uploader :image, MovieUploader

	has_many :reviews
	
	validates :title,
		presence: true

	validates :director,
	  presence: true

	validates :runtime_in_minutes,
	  numericality: { only_integer: true }

	validates :description,
	  presence: true

	validates :release_date,
	  presence: true

	validate :release_date_is_in_the_past

	def review_average
	  reviews.average(:rating_out_of_ten)
	end

	protected

	def release_date_is_in_the_past
	  if release_date.present?
	    errors.add(:release_date, "should be in the past") if release_date > Date.today
	  end
	end

end
