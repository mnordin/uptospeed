class EmailProcessor
  def self.process(email)
    raise "Not sending it to correct email address, email: #{email.inspect}" unless self.correct_email_address?(email.to)

    if user = self.find_user_from_email_address(email.from)
      self.parse_and_create_workouts!(email.body, user)
      self.parse_and_create_learnings!(email.body, user)
    else
      raise "Not sending from an accepted email address, email: #{email.inspect}"
    end
  end

  private

  def self.parse_and_create_workouts!(body, user)
    body.match(/(\d) *workout/).try(:[], 1).to_i.times do
      user.workouts.create!
    end
    body.match(/(\d) *workout/).try(:[], 1).to_i
  end

  def self.parse_and_create_learnings!(body, user)
    body.match(/(\d) *learning/).try(:[], 1).to_i.times do
      user.learnings.create!
    end
    body.match(/(\d) *learning/).try(:[], 1).to_i
  end

  def self.find_user_from_email_address(from_address)
    return user if user = User.where(email: from_address).first
    if from_address.include? "@mynewsdesk.com"
      local_part = from_address.match(/^(.*)@/)[1]
      User.where(email: "#{local_part}@newsdesk.se").first
    end
  end

  def self.correct_email_address?(to_addresses)
    to_addresses.include? "register@uptospeed.se"
  end
end
