require 'rails_helper'

RSpec.describe Match, type: :model do
  it { should have_and_belong_to_many(:games) }
  it { should belong_to(:team1).class_name(Team).with_foreign_key("team1_id") }
  it { should belong_to(:team2).class_name(Team).with_foreign_key("team2_id") }
end
