require "rails_helper"

describe AnimalsController do
	
	describe 'POST#create' do
		subject { post(:create, { animal: { specie:'pig' } }) }
		
		it 'creates a new animal' do	
			expect{subject}.to change{Animal.count}.by(1)
			expect(subject).to redirect_to(action: :show, id: assigns(:animal).id)
		end
	end

	describe 'GET#show' do
		let	(:animal){Animal.create(specie: 'pig')}
		it 'shows an animal' do
			get(:show, id: animal.id)
			expect(response.code).to eq '200'
			expect(assigns(:animal)).to eq animal
		end
	end

	describe 'GET#index' do
		let(:animal){ Animal.create(specie: 'pig') }
		it 'shows all animals' do
			get(:index)
			expect(response.code).to eq '200'
			expect(assigns(:animals)).to eq [animal]
		end
	end

	describe 'DELETE#destroy' do
		it 'deletes an animal' do
			animal=Animal.create(specie: 'pig')
			delete(:destroy, id: animal.id)
			expect(response.code).to eq '302'
			expect(subject).to redirect_to(action: :index)
		end
	end

	describe 'PUT#update' do
		let(:animal){Animal.create(specie: 'pig')}
		it 'updates an animal' do
    	put(:update, id: animal.id, animal:{specie: 'chicken'})
    	animal.reload
    	expect(animal.specie).to eq 'chicken'
  		expect(response).to redirect_to(action: :index)
  	end
  end
end