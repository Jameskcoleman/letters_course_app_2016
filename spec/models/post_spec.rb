require 'spec_helper'

describe Post do
  it { should belong_to(:creator) }
  it { should have_many(:post_categories) }
end