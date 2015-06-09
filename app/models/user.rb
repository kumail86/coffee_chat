class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  geocoded_by :location
  after_validation :geocode, :if => :location_changed?

  has_many :received_meetings, :class_name => "Meeting", :foreign_key => "receiver_id"
  has_many :requested_meetings, :class_name => "Meeting", :foreign_key => "requestor_id"
end
