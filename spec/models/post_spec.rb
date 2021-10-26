require 'rails_helper'

RSpec.describe Post, type: :model do
    describe 'Fonction de modèle des posts' do
      context 'Si le nom du post est vide' do
        it 'Rester bloqué dans la validation' do
          post = Post.new(name: nil)
          expect(post).not_to be_valid
        end
      end
    end
    describe 'Fonction de validation des posts vides' do
      context "Lorsque l'utilisateur tente de créer un post dont le nom est vide" do
        it 'Revoyer le message: Name doit être rempli(e)' do
          post = Post.new(name: nil)
          expect(post).not_to be_valid
        end
      end
    end
    context "Lorsque l'utilisateur tente de créer un post dont le contenu est vide" do
      it 'Revoyer le message: Contenu doit être rempli(e)' do
        post = Post.new(content: nil)
        expect(post).not_to be_valid
      end
    end
    describe 'Fonction de validation des posts décrites' do
      context 'Si le nom et le contenu du post sont décrits' do
        it 'Validation réussie' do
          post = Post.new(name: "Diver Projet original", content: "Students Helper")
          expect(post).to be_valid
        end
      end
    end
    describe 'Fonction de recherche de post avec la méthode scope' do
      before do
        user = create :user
        user= User.last
        @post = FactoryBot.create(:post, name: 'Diver', content: 'Liste des diplômés', attachment: 'Document', user_id: user.id)
      end
      it 'Rechercher par le titre de la publication' do
        expect(Post.title_search('Diver')).to include(@post)
    end
end
end 