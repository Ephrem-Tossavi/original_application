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
        user = create :user
        user= User.last
        @post = FactoryBot.create(:post, name: 'Diver', content: 'Liste des diplômés', attachment: 'Document', user_id: user.id)
        #post1 = FactoryBot.create(:post, name: 'Diver1', content: 'Liste des admissibles', attachment: 'Document1', user_id: user.id)
        #post2 = FactoryBot.create(:second_post, name: 'Diver2', content: 'Liste des refusés', attachment: 'Document2', user_id: user.id)
      end
      it 'Rechercher par le titre de la publication' do
        expect(Post.title_search('Diver')).to include(@post)
    end
end
end 