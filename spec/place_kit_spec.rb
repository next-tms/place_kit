# frozen_string_literal: true

RSpec.describe(PlaceKit) do
  describe('.lookup') do
    subject(:result) { described_class.lookup(*args) }

    let(:args) { ['US', 'CA', 'Los Angeles'] }

    it { is_expected.to be_a(ActiveSupport::TimeZone) }
    it { expect(result.tzinfo.name).to(eq('America/Los_Angeles')) }

    context 'when country, region, and/or city are improperly cased' do
      let(:args) { ['us', 'Ca', 'Los angeles'] }

      it { is_expected.to be_a(ActiveSupport::TimeZone) }
      it { expect(result.tzinfo.name).to(eq('America/Los_Angeles')) }
    end

    context 'when country, region, and/or city are Symbol' do
      let(:args) { [:US, :CA, :'Los Angeles'] }

      it { is_expected.to be_a(ActiveSupport::TimeZone) }
      it { expect(result.tzinfo.name).to(eq('America/Los_Angeles')) }
    end

    context 'when unknown location' do
      let(:args) { %w[XX YY Nowhere] }

      it { is_expected.to be_nil }
    end
  end
end
