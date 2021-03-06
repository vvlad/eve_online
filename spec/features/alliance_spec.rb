# frozen_string_literal: true

require 'spec_helper'

describe 'Get alliance information' do
  let(:options) { { alliance_id: 99_005_443 } }

  before { VCR.insert_cassette 'esi/alliance/99005443' }

  after { VCR.eject_cassette }

  subject { EveOnline::ESI::Alliance.new(options) }

  specify do
    expect(subject.as_json).to eq(name: 'Kids With Guns Alliance',
                                  creator_id: 94_195_096,
                                  creator_corporation_id: 98_306_624,
                                  ticker: '-KWG-',
                                  date_founded: '2015-05-03T19:45:17Z',
                                  executor_corporation_id: 98_306_624,
                                  faction_id: nil)
  end
end
