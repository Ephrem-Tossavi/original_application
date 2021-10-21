require 'rails_helper'

RSpec.describe Tag, type: :model do
  
  describe "Fonction d'étiquetes Tag" do
    context 'Si le contenu du Tag est vide' do
      it 'Ne pas pouvoir créer le Tag' do
        comment = Tag.new(name: '')
        expect(comment).not_to be_valid
      end
    end
  end
  describe 'Fonction de validation du Tag' do
    context 'Si le nom du Tag existe réelement' do
      it 'Valider la création du Tag' do
        comment = Tag.new(name: 'Biologie')
        expect(comment).to be_valid
      end
    end
  end
end
