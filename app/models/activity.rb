class Activity
  include Mongoid::Document

  field :title
  field :keywords,  default: []

end
