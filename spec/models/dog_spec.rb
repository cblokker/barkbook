require 'rails_helper'

RSpec.describe Dog, type: :model do
  it { should belong_to(:user) }
end
