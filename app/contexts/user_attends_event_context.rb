class UserAttendsEventContext < Context
  attr_accessor :user, :event

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def attend_event!
    extend_with_roles(user, ["attending"])
    extend_with_roles(event, ["attendance"])
    user.attend(event)
    Event.attend_on_google(event.google_id, user)
  end

end