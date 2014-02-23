class User
  include Mongoid::Document

  has_and_belongs_to_many :activities
  has_one :location, as: :locatable
  field :name

  validates_presence_of :name
end
