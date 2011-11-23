module Users::AttendingRole

  def attend(event)
    self.attendances.create(:event => event)
  end

  def unattend(event)
    attendance = self.attendances.find_by_event_id(event.id)
    attendance.destroy
  end
end