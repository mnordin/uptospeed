module AttendingRole

  def attend(event)
    Attendance.create(:user_id => self.id, :event_id => event.id)
  end

  def unattend(event)
    Attendande.destroy(:user_id => self.id, :event_id => event.id)
  end

end