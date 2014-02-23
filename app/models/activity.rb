class Activity
  include Mongoid::Document
  include Mongoid::Search
  DEFAULT_NEARBY_DISTANCE = 16100 # ~ 10 miles

  has_and_belongs_to_many :users
  has_and_belongs_to_many :tags
  has_one :location, as: :locatable

  field :title
  field :tags, default: []

  search_in :title, :tags => :name

  def nearby_users
    locations = Location.nearby_coordinates(self.location.coordinates, radius: DEFAULT_NEARBY_DISTANCE)
    users_nearby = []
    locations.each do |l|
      if l.locatable && l.locatable_type == "User"
        users_nearby << l.locatable 
      end
    end
    users_nearby
  end

end
