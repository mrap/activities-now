class Activity
  include Mongoid::Document
  include Mongoid::Search

  field :title
  field :tags, default: []

  search_in :title, :tags

end
