require 'forwardable'

module EveOnline
  module ESI
    class CharacterFatigue < Base
      extend Forwardable

      API_ENDPOINT = 'https://esi.tech.ccp.is/v1/characters/%s/fatigue/?datasource=tranquility'.freeze

      attr_reader :character_id

      def initialize(options)
        super

        @character_id = options[:character_id]
      end

      def_delegators :model, :as_json, :jump_fatigue_expire_date,
                     :last_jump_date, :last_update_date

      def model
        Models::Fatigue.new(response)
      end
      memoize :model

      def scope
        'esi-characters.read_fatigue.v1'
      end

      def url
        API_ENDPOINT % character_id
      end
    end
  end
end
