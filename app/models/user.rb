class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :bookings, foreign_key: "participant_id"
  has_many :events, foreign_key: "organizer_id"

  # has_many :events, foreign_key: "organizer_id"
  # has_many :events
  has_many :reviewer_reviews, foreign_key: "reviewer_id", class_name: "Review"
  # def reviewer_reviews
  #   Review.where(reviewer_id: self.id)
  # end

  has_many :reviewee_reviews, foreign_key: "reviewee_id", class_name: "Review"
end

