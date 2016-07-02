
require 'everypolitician'
require 'everypolitician/popolo'
require 'json'
require 'open-uri'
require 'pry'

module EveryPolitician
  
  class GenderStats

    def initialize(country_name, legislature_name)
      @cname = country_name
      @lname = legislature_name
    end

    def popolo
      @_popolo ||= legislature.popolo
    end

    def data
      {
        slug: legislature.slug,
        totals: {
          overall: gender_totals,
        }
      }
    end

    private

    def legislature
      @_leg ||= Everypolitician.legislature(@cname, @lname)
    end

    def gender_lookup
      @_ppl ||= Hash[popolo.persons.map { |p| [p.id, p.gender || 'unknown'] }]
    end

    def memberships
      @_mems = popolo.memberships.map do |m|
        {
          person: m.person_id,
          gender: gender_lookup(m.person_id),
          term: m.legislative_period_id,
          party: m.on_behalf_of_id,
        }
      end
    end

    def gender_totals
      Hash[ gender_lookup.values.group_by { |g| g }.map { |g, gs| [g, gs.count] } ]
    end

  end
end


