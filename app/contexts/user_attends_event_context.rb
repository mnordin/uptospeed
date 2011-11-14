class UserAttendsEventContext
  attr_accessor :user, :event

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def attend_event
    require File.dirname(__FILE__) + '/../roles/users/attending_role.rb'
    user.extend AttendingRole
    user.attend(event)

    # if event.public?
    require File.dirname(__FILE__) + '/../roles/events/public_event_role.rb'
    event.extend PublicEventRole
    event.attend_on_google(user)
    # end
  end

  def unattend_event
    require File.dirname(__FILE__) + '/../roles/users/attending_role.rb'
    user.extend AttendingRole
    user.unattend(event)

    # if event.public?
    require File.dirname(__FILE__) + '/../roles/events/public_event_role.rb'
    event.extend PublicEventRole
    event.unattend_on_google(user)
    # end
  end

end