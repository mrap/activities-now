class Tag
  include Mongoid::Document

  has_and_belongs_to_many :activities
  has_and_belongs_to_many :users
  field :name
  validates_presence_of :name

end
