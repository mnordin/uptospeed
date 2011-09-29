class Event < ActiveRecord::Base
  # Events are (only?) stored when someone does something to them, e.g. attends
  # This is to be able to add more actions on them, like comments
  # TODO The calender object should probably be memcached for at least 30 min
  belongs_to :user

end
