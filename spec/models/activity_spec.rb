require 'spec_helper'

describe Activity do
  it { should have_field :title }
  it { should have_field(:keywords).with_default_value_of([])}
end
