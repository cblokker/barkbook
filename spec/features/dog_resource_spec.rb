require 'rails_helper'

describe 'Dog resource', type: :feature do
  context 'when user is logged in' do
    let(:user) { create(:user) }

    before do
      login_as(user, scope: :user)
    end

    it 'can create a profile' do
      visit new_dog_path
      fill_in 'Name', with: 'Speck'
      fill_in 'Description', with: 'Just a dog'
      attach_file(
        'Image',
        ['spec/fixtures/images/speck.jpg', 'spec/fixtures/images/speck.jpg']
      )
      click_button 'Create Dog'
      expect(Dog.count).to eq(1)
      expect(Dog.last.images.count).to eq(2)
    end

    it 'can edit a dog profile' do
      dog = create(:dog)
      visit edit_dog_path(dog)
      fill_in 'Name', with: 'Speck'
      attach_file(
        'Image',
        ['spec/fixtures/images/speck.jpg', 'spec/fixtures/images/speck.jpg']
      )
      click_button 'Update Dog'
      expect(dog.reload.name).to eq('Speck')
      expect(dog.images.count).to eq(3)
    end

    it 'can delete a dog profile' do
      dog = create(:dog)
      visit dog_path(dog)
      click_link "Delete #{dog.name}'s Profile"
      expect(Dog.count).to eq(0)
    end
  end
end
