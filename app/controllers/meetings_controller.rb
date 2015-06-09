class MeetingsController < ApplicationController

  def meeting_request
    @meet = Meeting.new
    @meet.requestor_id = current_user.id
    @meet.receiver_id = params[:id]
    @meet.meeting_status = "pending"
    if @meet.save
      redirect_to "/networking", :notice => "Coffee Chat request sent successfully."
    else
      render 'index'
    end
  end

  def show
    @confirmed_meetings = Meeting.where("(requestor_id = ? OR receiver_id = ?) AND meeting_status = ?", current_user.id, current_user.id, "confirmed")
    @pending_meetings_sent = Meeting.where("requestor_id = ? AND meeting_status != ?", current_user.id, "pending")
    @pending_meetings_received = Meeting.where("receiver_id = ? AND meeting_status = ?", current_user.id, "pending")
  end

  def accept
    @meet = Meeting.find_by("requestor_id = ? AND receiver_id = ?", params[:id], current_user.id)
    @meet.meeting_status = "confirmed"

    if @meet.save
      redirect_to "/my_meetings", :notice => "Meeting accepted successfully."
    else
      render 'index'
    end
  end

end
