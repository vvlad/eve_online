require 'spec_helper'

describe EveOnline::ESI::Models::AllianceIcon do
  let(:options) { double }

  subject { described_class.new(options) }

  it { should be_a(EveOnline::ESI::Models::Base) }

  describe '#initialize' do
    its(:options) { should eq(options) }
  end

  describe '#as_json' do
    let(:alliance_icon) { described_class.new(options) }

    before { expect(alliance_icon).to receive(:small).and_return('http://image.eveonline.com/Alliance/99005443_64.png') }

    before { expect(alliance_icon).to receive(:medium).and_return('http://image.eveonline.com/Alliance/99005443_128.png') }

    subject { alliance_icon.as_json }

    its([:small]) { should eq('http://image.eveonline.com/Alliance/99005443_64.png') }

    its([:medium]) { should eq('http://image.eveonline.com/Alliance/99005443_128.png') }
  end

  describe '#small' do
    before { expect(options).to receive(:[]).with('px64x64') }

    specify { expect { subject.small }.not_to raise_error }
  end

  describe '#medium' do
    before { expect(options).to receive(:[]).with('px128x128') }

    specify { expect { subject.medium }.not_to raise_error }
  end
end