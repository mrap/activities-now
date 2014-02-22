class Tag
  include Mongoid::Document

  has_many :activities
end
