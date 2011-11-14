module AttendingRole

  def attend(event)
    Attendance.create(:user_id => self.id, :event_id => event.id)
  end

  def unattend(event)
  	attendance = Attendance.find_by_user_id_and_event_id(self.id, event.id)
  	attendance.destroy
  end
end