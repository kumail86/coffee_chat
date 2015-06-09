class Meeting < ActiveRecord::Base
  belongs_to :requestor, class_name: "User", foreign_key: "requestor_id"
  belongs_to :receiver, class_name: "User", foreign_key: "receiver_id"
end
