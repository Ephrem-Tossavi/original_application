FactoryBot.define do
  factory :comment do
    post {@post.id}
    user { user.id  }
    content { "MyText" }
  end
end
