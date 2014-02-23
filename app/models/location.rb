class Location
  include Mongoid::Document
  include Mongoid::Geospatial
  METERS_PER_ARCDEG = 111_000

  belongs_to :locatable, polymorphic: true

  geo_field :coordinates
  validates_presence_of :coordinates

  def serializable_hash(options={})
    hash = super(options)
    hash.delete('coordinates')
    hash[:longitude] = self.coordinates.longitude
    hash[:latitude] = self.coordinates.latitude
    return hash
  end

  # Queries for places located nearby given coordinates within an optional radius.
  # @param  coordinates [Coordinates] center of the query.
  # @option radius distance from center in meters.
  # @return [Mongoid::Critera]
  def self.nearby_coordinates(coordinates, options = {})
    if options[:radius]
      radius = Location.meters_to_arcdeg(options[:radius].to_f)
      Location.near(coordinates: coordinates).max_distance(coordinates: radius)
    else
      Location.near(coordinates: coordinates)
    end
  end

  # Returns the distance from a place's coordinates to other coordinates.
  # @params coordinates [Coordinates] to compare distance to.
  # @return distance [Float] in meters.
  def distance_to_coordinates(coordinates)
    from     = Vincenty.new(self.latitude, self.longitude)
    to       = Vincenty.new(coordinates.latitude, coordinates.longitude)
    return from.distanceAndAngle(to).distance
  end

  # Returns place's longitude
  def longitude
    self.coordinates.longitude
  end

  # Returns place's latitude
  def latitude
    self.coordinates.latitude
  end

  private

    # Converts meters to arc degrees
    # @param meters
    # @return arc degrees
    def self.meters_to_arcdeg(meters)
      meters.fdiv(METERS_PER_ARCDEG)
    end

end
