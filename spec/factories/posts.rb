Factory.define( :post ) do |f|
  f.user { |a| a.association( :user ) }
  f.content "abc"
end
