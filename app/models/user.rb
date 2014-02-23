class User
  include Mongoid::Document

  has_and_belongs_to_many :activities
  has_and_belongs_to_many :tags
  has_one :location, as: :locatable
  field :name
  field :device_token

  validates_presence_of :name
end
