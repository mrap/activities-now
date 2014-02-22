require 'spec_helper'

describe Tag do
  it { should have_many :activities }
  it { should have_field :name }
  it { should validate_uniqueness_of :name }
end
