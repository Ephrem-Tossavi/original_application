FactoryBot.define do
  factory :post do
    name {'titre1_factory'}
    content {'contenu1_factory'}
    attachment {nil}
    user_id { user.id }
  end
  factory :second_post, class: Post do
    name {'titre2_factory'}
    content {'contenu2_factory'}
    attachment {nil}
    user_id { user.id }
    
  end
end
