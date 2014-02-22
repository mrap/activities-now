class Activity
  include Mongoid::Document

  field :title
  has_many :tags

end
