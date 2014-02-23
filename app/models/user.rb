class User
  include Mongoid::Document

  has_and_belongs_to_many :activities
  field :name

  validates_presence_of :name
end
