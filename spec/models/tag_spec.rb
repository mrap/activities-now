require 'spec_helper'

describe Tag do
  it { should have_and_belong_to_many :activities }
  it { should have_and_belong_to_many :users }
  it { should have_field :name }
  it { should validate_presence_of :name }
end
