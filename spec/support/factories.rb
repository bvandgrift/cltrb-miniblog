Factory.sequence :number do
  @current ||= 0
  @current += 1
end

Factory.sequence :email do
  "user_#{Factory.next(:number)}@host.com"
end

Factory.define :post do |a|
  a.title "Article #{Factory.next(:number)}"
  a.content "Some Content #{Factory.next(:number)}"
end

Factory.define :comment do |c|
  c.author email = Factory.next(:email)
  c.body "Some comments, by #{email}"
  c.association :post
end

