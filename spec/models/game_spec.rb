require 'rails_helper'

RSpec.describe Game, type: :model do
  it { should belong_to(:team1).class_name(Team).with_foreign_key("team1_id") }
  it { should belong_to(:team2).class_name(Team).with_foreign_key("team2_id") }
  it { should validate_presence_of(:team1) }
  it { should validate_numericality_of(:score_team1).with_message("Score must be in 0-10") }
  it { should validate_numericality_of(:score_team2).with_message("Score must be in 0-10") }
end
