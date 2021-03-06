# frozen_string_literal: true

module EveOnline
  module ESI
    class CharacterOrders < Base
      API_ENDPOINT = 'https://esi.tech.ccp.is/v1/characters/%<character_id>s/orders/?datasource=tranquility'

      attr_reader :character_id

      def initialize(options)
        super

        @character_id = options[:character_id]
      end

      def orders
        output = []
        response.each do |order|
          output << Models::CharacterOrder.new(order)
        end
        output
      end
      memoize :orders

      def scope
        'esi-markets.read_character_orders.v1'
      end

      def url
        format(API_ENDPOINT, character_id: character_id)
      end
    end
  end
end
