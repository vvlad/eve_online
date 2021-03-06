# frozen_string_literal: true

module EveOnline
  module ESI
    class UniverseTypes < Base
      API_ENDPOINT = 'https://esi.tech.ccp.is/v1/universe/types/?datasource=tranquility&page=1'

      def universe_types_ids
        response
      end

      def scope; end

      def url
        API_ENDPOINT
      end
    end
  end
end
