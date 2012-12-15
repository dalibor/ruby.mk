FactoryGirl.define do
  factory :post do |f|
    f.title "My first blog post"
    f.content "This is my first blog post"
    f.publish true
    f.tag_names nil
    f.published_at { Time.now }
    f.association :editor
  end
end
