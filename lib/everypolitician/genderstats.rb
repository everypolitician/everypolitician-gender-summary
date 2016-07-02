
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
      {}
    end

    private

    def legislature
      @_leg ||= Everypolitician.legislature(@cname, @lname)
    end

  end
end


