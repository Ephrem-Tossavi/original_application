require 'rails_helper'

RSpec.describe 'Fonction de gestion des Commentaires', type: :system do
    before do
    
    user = create :user

    visit new_user_session_path

    fill_in "user[email]", with: user.email
    fill_in "user[password]", with: user.password
    click_button I18n.t('views.messages.Log in')

    user= User.last

    @post = FactoryBot.create(:post, name: 'Diver', content: 'Liste des diplômés', attachment: 'Document', user_id: user.id )

    end

  describe 'Nouvelle fonction de création' do
    context "Lors de la création d'un nouveau commentaire" do
      it "Le commentaire créé s'affiche" do
       
      end
    end
  end
  describe "Fonction d'affichage de liste" do
    context "Lors de la transition vers l'écran de liste" do
      it "Une liste des commentaires créées s'affiche" do
        visit posts_path
        click_on I18n.t('views.buttons.Show')

        user= User.last
        comment = FactoryBot.create(:comment, content: 'Commentaire du post', user_id: user.id , post_id: @post.id)
        sleep 2
        #click_on "commit"
        expect(page).to have_content 'Commentaire du post'
      end
    end
  end
     context "Lors de la mise à jour du commentaire du post" do
       it "Le formulaire d'édition est renvoyé avec le commentaire" do
        visit posts_path
        click_on I18n.t('views.buttons.Show')

        user= User.last
        comment = FactoryBot.create(:comment, content: 'Commentaire du post', user_id: user.id , post_id: @post.id)
        click_on "commit"
        sleep 2
        click_on I18n.t('views.buttons.Edit comment')
        expect(page).to have_content 'Commentaire du post'
       end
     end
    context "Lors de la suppression d'un commentaire" do
      it "Le commentaire supprimé est enlevé de la liste des commentaires" do
        user= User.last
        comment = FactoryBot.create(:comment, content: 'Commentaire du post', user_id: user.id , post_id: @post.id)
        visit posts_path
        click_on I18n.t('views.buttons.Show')
        
        #click_on "commit"
        expect(page).to have_content 'Commentaire du post'
        sleep 2

        expect(Comment.count).to eq(1)
        puts I18n.t('views.buttons.Delete comment')

        accept_alert do
            click_link I18n.t('views.buttons.Delete comment')
          end
          
        comment.reload
        visit posts_path
        expect(Comment.count).to eq(0)
        
      end
  end
end