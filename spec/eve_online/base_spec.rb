require 'spec_helper'

describe EveOnline::Base do
  describe '#initialize' do
    let(:key_id) { '123key' }

    let(:v_code) { '123v_code' }

    let(:parser) { Nori.new }

    subject { described_class.new(key_id, v_code, parser) }

    its(:key_id) { should eq(key_id) }

    its(:v_code) { should eq(v_code) }

    its(:parser) { should eq(parser) }
  end

  describe '#cached_until' do
    before do
      #
      # subject.eveapi.fetch('cachedUntil')
      #
      expect(subject).to receive(:eveapi) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('cachedUntil')
        end
      end
    end

    specify { expect { subject.cached_until }.not_to raise_error }
  end

  describe '#current_time' do
    before do
      #
      # subject.eveapi.fetch('currentTime')
      #
      expect(subject).to receive(:eveapi) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('currentTime')
        end
      end
    end

    specify { expect { subject.current_time }.not_to raise_error }
  end

  describe '#version' do
    specify { expect { subject.version }.to raise_error(NotImplementedError) }
  end

  describe '#eveapi' do
    before do
      #
      # subject.response.fetch('eveapi')
      #
      expect(subject).to receive(:response) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('eveapi')
        end
      end
    end

    specify { expect { subject.eveapi }.not_to raise_error }
  end

  describe '#url' do
    specify { expect { subject.url }.to raise_error(NotImplementedError) }
  end

  describe '#content' do
    let(:url) { 'https://google.com/' }

    before { expect(subject).to receive(:url).and_return(url) }

    before do
      #
      # subject.open(url).read
      #
      expect(subject).to receive(:open).with(url, open_timeout: 60, read_timeout: 60) do
        double.tap do |a|
          expect(a).to receive(:read)
        end
      end
    end

    specify { expect { subject.content }.not_to raise_error }
  end

  describe '#response' do
    let(:parser) { double }

    let(:content) { 'some xml content' }

    before { expect(subject).to receive(:content).and_return(content) }

    before { expect(subject).to receive(:parser).and_return(parser) }

    before { expect(parser).to receive(:parse).with(content) }

    specify { expect { subject.response }.not_to raise_error }
  end
end
