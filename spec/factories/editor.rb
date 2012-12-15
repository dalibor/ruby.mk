FactoryGirl.define do
  factory :editor do |f|
    f.name "Ping Panter"
    f.sequence(:email) {|i| "pink.panter#{i}@gmail.com"}
    f.password "password"
    f.password_confirmation "password"
  end

  factory :admin, :class => Editor, :parent => :editor do |f|
    f.is_admin true
  end
end

