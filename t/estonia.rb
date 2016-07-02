
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
    overall['total'].must_equal 192
  end

  it 'should have accurate totals for terms 12' do
    termdata = subject.data[:totals][:by_term]['term/12'][:overall]
    termdata['male'].must_equal 110
    termdata['female'].must_equal 28
    termdata['unknown'].must_equal 1
    termdata['total'].must_equal 139
  end

  it 'should have accurate totals for terms 13' do
    termdata = subject.data[:totals][:by_term]['term/13'][:overall]
    termdata['male'].must_equal 98
    termdata['female'].must_equal 28
    termdata['unknown'].must_equal 1
    termdata['total'].must_equal 127
  end

  it 'should have accurate totals for IRL' do
    partydata = subject.data[:totals][:by_party]['IRL'][:overall]
    partydata['male'].must_equal 31
    partydata['female'].must_equal 8
    partydata['unknown'].must_be_nil
    partydata['total'].must_equal 39
  end

  it 'should have accurate totals for EKRE' do
    partydata = subject.data[:totals][:by_party]['EKRE'][:overall]
    partydata['male'].must_equal 7
    partydata['female'].must_be_nil
    partydata['unknown'].must_be_nil
    partydata['total'].must_equal 7
  end

end
