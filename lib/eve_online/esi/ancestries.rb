# frozen_string_literal: true

module EveOnline
  module ESI
    class Ancestries < Base
      API_ENDPOINT = 'https://esi.tech.ccp.is/v1/universe/ancestries/?datasource=tranquility&language=en-us'

      def ancestries
        output = []
        response.each do |ancestry|
          output << Models::Ancestry.new(ancestry)
        end
        output
      end
      memoize :ancestries

      def scope; end

      def url
        API_ENDPOINT
      end
    end
  end
end
