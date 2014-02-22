class Activity
  include Mongoid::Document
  include Mongoid::Search

  field :title
  has_and_belongs_to_many :tags

  search_in :title, :tags => :name

end
