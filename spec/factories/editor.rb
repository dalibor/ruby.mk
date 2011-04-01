Factory.define :editor, :class => Editor do |f|
  f.name                  "Ping Panter"
  f.sequence(:email)      {|i| "pink.panter#{i}@gmail.com"}
  f.password              "password"
  f.password_confirmation "password"
end

Factory.define :admin, :class => Editor, :parent => :editor do |f|
  f.is_admin              true
end
