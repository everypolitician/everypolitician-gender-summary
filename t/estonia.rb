
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
    subject.data.class.must_equal Hash
  end

  it 'should include the slug' do
    subject.data[:slug].must_equal 'Riigikogu'
  end

  it 'should have accurate over-all totals' do
    overall = subject.data[:totals][:overall]
    overall['male'].must_equal 147
    overall['female'].must_equal 44
    overall['unknown'].must_equal 1
  end

  it 'should have accurate totals for terms 12' do
    termdata = subject.data[:totals][:by_term]['term/12']
    termdata['male'].must_equal 110
    termdata['female'].must_equal 28
    termdata['unknown'].must_equal 1
  end

  it 'should have accurate totals for terms 13' do
    termdata = subject.data[:totals][:by_term]['term/13']
    termdata['male'].must_equal 98
    termdata['female'].must_equal 28
    termdata['unknown'].must_equal 1
  end

end
