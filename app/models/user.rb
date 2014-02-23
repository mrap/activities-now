class User
  include Mongoid::Document
  DEFAULT_NEARBY_DISTANCE = 16100 # ~ 10 miles

  has_and_belongs_to_many :activities
  has_and_belongs_to_many :tags
  has_one :location, as: :locatable
  field :name
  field :device_token

  validates_presence_of :name

  def self.nearby_users_with_tag(coordinates, tag)
    matching_users = []
    locations = Location.nearby_coordinates(coordinates, radius: DEFAULT_NEARBY_DISTANCE)
    locations.each do |l|
      if l.locatable_type == "User"
        user = l.locatable
        matching_users << user if user.tags.include? tag
      end
    end
    matching_users
  end

end
