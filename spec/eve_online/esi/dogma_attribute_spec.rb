# frozen_string_literal: true

require 'spec_helper'

describe EveOnline::ESI::DogmaAttribute do
  let(:options) { { attribute_id: 2 } }

  subject { described_class.new(options) }

  specify { expect(subject).to be_a(EveOnline::ESI::Base) }

  specify { expect(described_class::API_ENDPOINT).to eq('https://esi.tech.ccp.is/v1/dogma/attributes/%<attribute_id>s/?datasource=tranquility') }

  describe '#initialize' do
    its(:parser) { should eq(JSON) }

    its(:attribute_id) { should eq(2) }
  end

  describe '#model' do
    let(:response) { double }

    before { expect(subject).to receive(:response).and_return(response) }

    let(:model) { double }

    before do
      #
      # EveOnline::ESI::Models::DogmaAttribute.new(response) # => model
      #
      expect(EveOnline::ESI::Models::DogmaAttribute).to receive(:new).with(response).and_return(model)
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

  describe '#id' do
    let(:model) { double }

    before { subject.instance_variable_set(:@_memoized_model, model) }

    before { expect(model).to receive(:id) }

    specify { expect { subject.id }.not_to raise_error }
  end

  describe '#name' do
    let(:model) { double }

    before { subject.instance_variable_set(:@_memoized_model, model) }

    before { expect(model).to receive(:name) }

    specify { expect { subject.name }.not_to raise_error }
  end

  describe '#description' do
    let(:model) { double }

    before { subject.instance_variable_set(:@_memoized_model, model) }

    before { expect(model).to receive(:description) }

    specify { expect { subject.description }.not_to raise_error }
  end

  describe '#icon_id' do
    let(:model) { double }

    before { subject.instance_variable_set(:@_memoized_model, model) }

    before { expect(model).to receive(:icon_id) }

    specify { expect { subject.icon_id }.not_to raise_error }
  end

  describe '#default_value' do
    let(:model) { double }

    before { subject.instance_variable_set(:@_memoized_model, model) }

    before { expect(model).to receive(:default_value) }

    specify { expect { subject.default_value }.not_to raise_error }
  end

  describe '#published' do
    let(:model) { double }

    before { subject.instance_variable_set(:@_memoized_model, model) }

    before { expect(model).to receive(:published) }

    specify { expect { subject.published }.not_to raise_error }
  end

  describe '#display_name' do
    let(:model) { double }

    before { subject.instance_variable_set(:@_memoized_model, model) }

    before { expect(model).to receive(:display_name) }

    specify { expect { subject.display_name }.not_to raise_error }
  end

  describe '#unit_id' do
    let(:model) { double }

    before { subject.instance_variable_set(:@_memoized_model, model) }

    before { expect(model).to receive(:unit_id) }

    specify { expect { subject.unit_id }.not_to raise_error }
  end

  describe '#stackable' do
    let(:model) { double }

    before { subject.instance_variable_set(:@_memoized_model, model) }

    before { expect(model).to receive(:stackable) }

    specify { expect { subject.stackable }.not_to raise_error }
  end

  describe '#high_is_good' do
    let(:model) { double }

    before { subject.instance_variable_set(:@_memoized_model, model) }

    before { expect(model).to receive(:high_is_good) }

    specify { expect { subject.high_is_good }.not_to raise_error }
  end

  describe '#scope' do
    specify { expect(subject.scope).to eq(nil) }
  end

  describe '#url' do
    specify do
      expect(subject.url).to eq('https://esi.tech.ccp.is/v1/dogma/attributes/2/?datasource=tranquility')
    end
  end
end
