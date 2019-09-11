require 'rails_helper'

RSpec.describe Product, type: :model do
  describe '#name' do
    context 'when is less than 5 letters' do
      it { expect(FactoryBot.build(:product, name: 'Tody')).to be_invalid }
    end

    context 'when is greater than 50 letters' do
      it { expect(FactoryBot.build(:product, name: 'a' * 51)).to be_invalid }
    end
  end

  describe '#price' do
    context 'when price is zero' do
      it { expect(FactoryBot.build(:product, price: 0)).to be_invalid }
    end
  end

  describe '#barcode' do
    context 'when is a empty barcode' do
      it { expect(FactoryBot.build(:product, barcode: '')).to be_valid }
    end

    context 'when is a valid barcode' do
      it { expect(FactoryBot.build(:product)).to be_valid }
    end

    context 'when is an invalid barcode' do
      it { expect(FactoryBot.build(:product, barcode: '1234567891234')).to be_invalid }
    end
  end
end
