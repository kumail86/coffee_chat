class Meeting < ActiveRecord::Base
  validates :requestor_id, :presence => true
  validates :receiver_id,  :presence => true

  belongs_to :requestor, class_name: "User", foreign_key: "requestor_id"
  belongs_to :receiver, class_name: "User", foreign_key: "receiver_id"
end
