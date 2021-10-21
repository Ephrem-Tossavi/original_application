require 'rails_helper'

RSpec.describe Comment, type: :model do

  describe 'Fonction de modèle des comments' do
    context 'Si le contenu du comentaire est vide' do
      it 'Ne pas pouvoir publier le commentaire' do
        comment = Comment.new(content: '')
        expect(comment).to be_valid
      end
    end
  end
  describe 'Fonction de rejet des commentaires vides' do
    context 'Si le commentaire est vide' do
      it 'Renvoyer un message de rejet de la publication du commentaire' do
        comment = Comment.new(content: '')
        expect(comment).not_to be_valid
      end
    end
  end
  describe 'Fonction de validation des commentaires décrites' do
    context 'Si le contenu du commentaire est bien renseigné' do
      it 'Validation réussie' do
        user = create :user
        user= User.last
        @post = FactoryBot.create(:post, name: 'Diver', content: 'Liste des diplômés', attachment: 'Document', user_id: user.id )
        comment = Comment.new(content: 'Commentaire du post', user_id: user.id , post_id: @post.id)
        expect(comment).to be_valid
      end
    end
  end
end
