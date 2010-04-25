Factory.define( :post_tag ) do |f|
  f.post { |a| a.association :post }
  f.tag { |a| a.association :tag }
end
