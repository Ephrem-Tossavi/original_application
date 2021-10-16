require 'rails_helper'

RSpec.describe Post, type: :model do
    describe 'Fonction de modèle des posts' do
      context 'Si le nom de la publication est vide' do
        it 'Rester bloqué dans la validation' do
          post = post.new(name: '', content: "Test d'échec")
          expect(post).not_to be_valid
        end
      end
    end
    describe 'Fonction de validation des posts vides' do
      context 'Si les contenu de la publication sont vides' do
        it 'Validation interceptée' do
          # Décrivez le contenu ici
        end
      end
    end
    describe 'Fonction de validation des posts décrites' do
      context 'Si le nom et le contenu de la publication sont décrits' do
        it 'Validation réussie' do
          # Décrivez le contenu ici
        end
      end
    end
    describe 'Fonction de recherche de post avec la méthode scope' do
      before do
        @post1 = FactoryBot.create(:post, name: 'Diver1', content: 'Liste des admissibles', attachment: 'Document1')
        @post2 = FactoryBot.create(:second_post, name: 'Diver2', content: 'Liste des refusés', attachment: 'Document2')
      end
      it 'Rechercher par le titre de la publication' do
        expect(Post.title_search('Diver2')).to include(@post2)
    end
end
end 