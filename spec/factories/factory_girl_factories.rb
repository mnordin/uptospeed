FactoryGirl.define do
  factory :email, class: OpenStruct do
    # Griddler.configure.to is :email, change this factory if that is changed
    to ['register@uptospeed.se']
    from 'markus.nordin@mynewsdesk.com'
    subject ''
    body '1 workouts'
  end

  factory :user do
    email "markus.nordin@newsdesk.se"
    first_name "Markus"
    last_name "Nordin"
  end

  factory :workout do
    user
  end

  factory :learning do
    user
  end
end
