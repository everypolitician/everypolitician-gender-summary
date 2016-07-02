
require 'minitest/autorun'
require 'pry'
require 'everypolitician/genderstats'

Everypolitician.countries_json = 'https://raw.githubusercontent.com/everypolitician/everypolitician-data/c3d0918ac72594ff0f584e93e195f28b6fbeb446/countries.json'

describe 'estonia' do
  subject { EveryPolitician::GenderStats.new('Estonia', 'Riigikogu') }

  it 'should have a known number of memberships' do
    subject.popolo.memberships.count.must_equal 296
  end

  it 'should return data as a hash' do
    subject.data.must_equal Hash.new
  end
end
