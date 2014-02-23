require 'spec_helper'

describe User do
  it { should have_and_belong_to_many :activities }
  it { should have_field :name }
  it { should have_field :device_token }
  it { should validate_presence_of :name }
end
