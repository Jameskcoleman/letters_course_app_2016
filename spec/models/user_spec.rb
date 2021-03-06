require 'spec_helper'

describe User do
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }
  it { should validate_presence_of(:user_name) }
  it { should validate_uniqueness_of(:email) }
  it { should validate_uniqueness_of(:user_name) }
  it { should have_many(:posts) }
  it { should have_many(:letters) }
  it { should have_many(:comments) }
end