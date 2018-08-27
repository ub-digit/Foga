
Ransack.configure do |config|
  config.add_predicate 'has_every_term',
  arel_predicate: 'matches_all',
  formatter: proc { |v| 
    v.scan(/\"(.*?)\"|([\-\?\:\;\,\.\'\*\#\+\(\)\{\}\[\]\&\@\=a-zA-Z0-9åäöÅÄÖ]+)/).flatten.compact.map{
    |t| "%#{t}%"} },
  validator: proc { |v| v.present? },
  type: :string
end


Ransack.configure do |config|
  config.add_predicate 'has_any_term',
  arel_predicate: 'matches_any',
  formatter: proc { |v| v.scan(/\"(.*?)\"|(\w+)/).flatten.compact.map{|t| "%#{t}%"} },
  validator: proc { |v| v.present? },
  type: :string
end

Ransack.configure do |c|
  c.hide_sort_order_indicators = false

  # Raise errors if a query contains an unknown predicate or attribute.
  # Default is true (do not raise error on unknown conditions).
  c.ignore_unknown_conditions = false
end