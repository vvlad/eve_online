# frozen_string_literal: true

require 'spec_helper'

describe EveOnline::ESI::CharacterAttributes do
  let(:options) { { token: 'token123', character_id: 12_345_678 } }

  subject { described_class.new(options) }

  specify { expect(subject).to be_a(EveOnline::ESI::Base) }

  specify { expect(described_class::API_ENDPOINT).to eq('https://esi.tech.ccp.is/v1/characters/%<character_id>s/attributes/?datasource=tranquility') }

  describe '#initialize' do
    its(:token) { should eq('token123') }

    its(:parser) { should eq(JSON) }

    its(:character_id) { should eq(12_345_678) }
  end

  describe '#model' do
    let(:response) { double }

    before { expect(subject).to receive(:response).and_return(response) }

    let(:model) { double }

    before do
      #
      # EveOnline::ESI::Models::Attributes.new(response) # => model
      #
      expect(EveOnline::ESI::Models::Attributes).to receive(:new).with(response).and_return(model)
    end

    specify { expect { subject.model }.not_to raise_error }

    specify { expect { subject.model }.to change { subject.instance_variable_defined?(:@_memoized_model) }.from(false).to(true) }
  end

  describe '#as_json' do
    let(:model) { double }

    before { subject.instance_variable_set(:@_memoized_model, model) }

    before { expect(model).to receive(:as_json) }

    specify { expect { subject.as_json }.not_to raise_error }
  end

  describe '#charisma' do
    let(:model) { double }

    before { subject.instance_variable_set(:@_memoized_model, model) }

    before { expect(model).to receive(:charisma) }

    specify { expect { subject.charisma }.not_to raise_error }
  end

  describe '#intelligence' do
    let(:model) { double }

    before { subject.instance_variable_set(:@_memoized_model, model) }

    before { expect(model).to receive(:intelligence) }

    specify { expect { subject.intelligence }.not_to raise_error }
  end

  describe '#memory' do
    let(:model) { double }

    before { subject.instance_variable_set(:@_memoized_model, model) }

    before { expect(model).to receive(:memory) }

    specify { expect { subject.memory }.not_to raise_error }
  end

  describe '#perception' do
    let(:model) { double }

    before { subject.instance_variable_set(:@_memoized_model, model) }

    before { expect(model).to receive(:perception) }

    specify { expect { subject.perception }.not_to raise_error }
  end

  describe '#willpower' do
    let(:model) { double }

    before { subject.instance_variable_set(:@_memoized_model, model) }

    before { expect(model).to receive(:willpower) }

    specify { expect { subject.willpower }.not_to raise_error }
  end

  describe '#bonus_remaps' do
    let(:model) { double }

    before { subject.instance_variable_set(:@_memoized_model, model) }

    before { expect(model).to receive(:bonus_remaps) }

    specify { expect { subject.bonus_remaps }.not_to raise_error }
  end

  describe '#last_remap_date' do
    let(:model) { double }

    before { subject.instance_variable_set(:@_memoized_model, model) }

    before { expect(model).to receive(:last_remap_date) }

    specify { expect { subject.last_remap_date }.not_to raise_error }
  end

  describe '#accrued_remap_cooldown_date' do
    let(:model) { double }

    before { subject.instance_variable_set(:@_memoized_model, model) }

    before { expect(model).to receive(:accrued_remap_cooldown_date) }

    specify { expect { subject.accrued_remap_cooldown_date }.not_to raise_error }
  end

  describe '#scope' do
    specify { expect(subject.scope).to eq('esi-skills.read_skills.v1') }
  end

  describe '#url' do
    specify do
      expect(subject.url).to eq('https://esi.tech.ccp.is/v1/characters/12345678/attributes/?datasource=tranquility')
    end
  end
end
