require 'spec_helper'

describe Comment do
  it { should belong_to(:creator) }
  it { should belong_to(:commentable) }
end