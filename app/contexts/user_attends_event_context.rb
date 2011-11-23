class UserAttendsEventContext

  def initialize(user, event)
    @user = user
    @event = event
  end

  def self.execute(user, event)
    UserAttendsEventContext.new(user, event).execute
  end

  def execute
    raise "#{@user.name} is already attending #{@event.title}" if @event.users.include?(@user)

    @user.extend Users::AttendingRole
    @user.attend(@event)

    if @event.public?
      @event.extend Events::PublicEventRole
      unless @event.attend_on_google(@user)
        # raise "error syncing with google"
      end
    end
  end
end