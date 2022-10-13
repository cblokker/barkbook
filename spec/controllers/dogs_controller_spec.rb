require 'rails_helper'

RSpec.describe DogsController, type: :controller do
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
end
