# frozen_string_literal: true

require 'forwardable'

module EveOnline
  module ESI
    class Character < Base
      extend Forwardable

      API_ENDPOINT = 'https://esi.tech.ccp.is/v4/characters/%<character_id>s/?datasource=tranquility'

      attr_reader :character_id

      def initialize(options)
        super

        @character_id = options[:character_id]
      end

      def_delegators :model, :as_json, :corporation_id, :birthday, :name,
                     :gender, :race_id, :bloodline_id, :description,
                     :alliance_id, :ancestry_id, :security_status, :faction_id

      def model
        Models::Character.new(response)
      end
      memoize :model

      def scope; end

      def url
        format(API_ENDPOINT, character_id: character_id)
      end
    end
  end
end
