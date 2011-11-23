class UserUnattendsEventContext

  def initialize(user, event)
    @user = user
    @event = event
  end

  def self.execute(user, event)
    UserUnattendsEventContext.new(user, event).execute
  end

  def execute
    raise "#{@user.name} is already attending #{@event.title}" unless @event.users.include?(@user)

    @user.extend Users::AttendingRole
    @user.unattend(@event)

    if @event.public?
      @event.extend Events::PublicEventRole
      unless @event.unattend_on_google(@user)
        # raise "error syncing with google"
      end
    end
  end
end