class MeetingsController < ApplicationController

  def meeting_request
    @meet = Meeting.new
    @meet.requestor_id = current_user.id
    @meet.receiver_id = params[:id]
    @meet.accepted = null

    if @meet.save
      redirect_to "/networking", :notice => "Coffee Chat request sent successfully."
    else
      render 'index'
    end
  end

  def show
    @confirmed_meetings = Meeting.where("(requestor_id = ? OR receiver_id = ?) AND accepted = ?", current_user.id, current_user.id, true)
    @pending_meetings_sent = Meeting.where("requestor_id = ? AND accepted != ?", current_user.id, true)
    @pending_meetings_received = Meeting.where("receiver_id = ? AND accepted = ?", current_user.id, false)
  end

  def accept
    @meet = Meeting.find_by("requestor_id = ? AND receiver_id = ?", params[:id], current_user.id)
    @meet.accepted = true

    if @meet.save
      redirect_to "/my_meetings", :notice => "Meeting accepted successfully."
    else
      render 'index'
    end
  end

end
