class Tag
  include Mongoid::Document

  has_and_belongs_to_many :activities
  field :name

  validates_uniqueness_of :name
end
