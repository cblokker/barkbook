require 'rails_helper'

RSpec.describe DogsController, type: :controller do
  shared_context 'logged in as user' do
    let(:user) { create(:user) }

    before do
      sign_in(user)
    end
  end

  let(:valid_dog_params) do
    { dog: FactoryBot.attributes_for(:dog) }
  end

  describe '#index' do
    it 'displays recent dogs' do
      2.times { create(:dog) }
      get :index
      expect(assigns(:dogs).size).to eq(2)
    end

    context 'for pagination' do
      it 'displays only 5 of the dogs' do
        7.times { create(:dog) }
        get :index
        expect(assigns(:dogs).size).to eq(5)
      end
    end
  end

  describe 'POST #create' do
    context 'with a current user' do
      include_context 'logged in as user'

      context "with valid attributes" do
        it 'creates a new dog' do
          expect {
            post :create, params: valid_dog_params
          }.to change(Dog, :count).by(1)
        end

        it "redirects to the new dog" do
          post :create, params: valid_dog_params
          response.should(redirect_to Dog.last)
        end

        it 'returns 200 status'
      end

      context 'with invalid attributes' do
        it 'should not create a new dog'
      end
    end

    context 'without a current user' do
      it 'should not create a new dog'
    end
  end

  describe 'PATCH #update' do
    context 'with a current_user' do
      include_context 'logged in as user'

      let(:dog) { create(:dog, name: 'Bark', user: user) }

      context 'who owns the dog' do
        it 'updates the dog' do
          expect {
            patch :update, params: valid_dog_params.merge(id: dog.id)
          }.to change(Dog, :count).by(1)
        end
      end

      context 'who does not own the dog' do
        it 'does not update the dog' do
          new_user = create(:user)
          new_dog = create(:dog, name: 'Woof', user: new_user)

          expect {
            patch :update, params: valid_dog_params.merge(id: new_dog.id)
          }.to raise_error(CanCan::AccessDenied)
        end
      end
    end

    context 'without a current_user' do
      it 'should not update the dog' do
        dog = create(:dog)

        expect {
          patch :update, params: valid_dog_params.merge(id: dog.id)
        }.to raise_error(CanCan::AccessDenied)
      end
    end
  end

  describe 'DELETE destroy' do
    let!(:dog) { create(:dog) }
    
    it "deletes the dog" do
      expect{
        delete :destroy, params: { id: dog.id }
      }.to change(Dog, :count).by(-1)
    end
      
    it "redirects to dogs#index" do
      delete :destroy, params: { id: dog.id }
      response.should redirect_to dogs_url
    end
  end
end
