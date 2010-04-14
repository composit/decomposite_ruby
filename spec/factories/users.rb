Factory.define :user do |f|
  f.sequence( :email ) { |n| "abc#{n}@example.com" }
  f.login "abc"
  f.password "abcd"
  f.password_confirmation "abcd"
end
