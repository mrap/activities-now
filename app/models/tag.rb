class Tag
  include Mongoid::Document

  has_many :activities
  field :name

  validates_uniqueness_of :name
end
