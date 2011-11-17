class UserAttendsEventContext
  attr_accessor :user, :event

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def attend_event
    user.extend Users::AttendingRole
    user.attend(event)

    # if event.public?
    event.extend Events::PublicEventRole
    event.attend_on_google(user)
    # end
  end

  def unattend_event
    user.extend Users::AttendingRole
    user.unattend(event)

    # if event.public?
    event.extend Events::PublicEventRole
    event.unattend_on_google(user)
    # end
  end

end