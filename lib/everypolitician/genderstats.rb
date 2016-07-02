
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

    def gender_totals
      Hash[popolo.persons.group_by { |p| p.gender || 'unknown' }.map { |g, ps| [g, ps.count] }]
    end

  end
end


