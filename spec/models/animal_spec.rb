require 'rails_helper'

describe Animal do

  let(:animal){Animal.create(specie:'g')}
	
  describe '#legs' do
    context 'when the animal is a pig' do
      before do
        allow(animal).to receive(:specie).and_return 'pig'
      end
  		it 'returns 4 legs' do
        expect(animal.legs).to eq 4
      end
    end
    context 'when the animal is a chicken' do
      before do
        allow(animal).to receive(:specie).and_return 'chicken'
      end
      it 'returns 2 legs' do
        expect(animal.legs).to eq 2
      end
    end
    context 'when the animal is an octopus' do
      before do
        allow(animal).to receive(:specie).and_return 'octopus'
      end
      it 'returns 8 legs' do
        expect(animal.legs).to eq 8
      end
    end
	end

end