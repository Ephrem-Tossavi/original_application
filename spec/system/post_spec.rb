require 'rails_helper'
RSpec.describe 'Fonction de gestion des posts', type: :system do
    before do
    
    user = create :user

    visit new_user_session_path

    fill_in "user[email]", with: user.email
    fill_in "user[password]", with: user.password
    click_button I18n.t('views.messages.Log in')

    user= User.last

    post = FactoryBot.create(:post, name: 'Diver', content: 'Liste des diplômés', attachment: 'Document', user_id: user.id)

    FactoryBot.create(:tag)
    FactoryBot.create(:tagging)

    end
  describe 'Nouvelle fonction de création' do
    context "Lors de la création d'un nouveau post" do
      it "Le post créée s'affiche" do
        #post = FactoryBot.create(:post, name: 'post')
        #visit posts_path
        #expect(page).to have_content 'post'
      end
    end
  end
  describe "Fonction d'affichage de liste" do
    context "Lors de la transition vers l'écran de liste" do
      it "Une liste des posts créées s'affiche" do
        visit posts_path
        expect(page).to have_content 'Diver'
      end
    end
    context "Lorsque les posts sont classées par ordre décroissant de date et d'heure de création" do
      it 'La nouvelle publication  est affichée en haut' do
        @posts = Post.all.order("created_at desc")
        visit posts_path
        @post_list = all(".post_row")
        
        expect(@post_list[0]).to have_content 'Diver'
      end
    end
  end
  describe "Fonction d'affichage détaillé" do
     context "Lors de la transition vers un écran de détails du post" do
       it "Le contenu de la publication correspondante s'affiche" do
       end
     end
  end
  describe "Fonction de recherche des posts" do
    context "Si vous effectuez une recherche par Title" do
      it "Filtrer par publication qui incluent des mots-clés de recherche" do
        visit posts_path
        fill_in 'search_title', with: 'Diver'
        expect(page).to have_content 'Diver'
      end
    end
  end
  describe "Fonction Tag" do
    context "rechercher par tag" do
        it "Retourner une liste avec recherche d'étiquette " do
          visit posts_path
          select "Biologie", from: "search_tag"
          click_on I18n.t('views.form.search')
          expect(page).to have_content 'Biologie' 
        end
    end
  end
  describe "Fonction Favorite" do
    context "Choisir un post comme favoris" do
      it "Ne peut mettre sa propre publication comme favoris" do
        visit posts_path
        click_on I18n.t('views.buttons.Show')
        expect(page).to have_no_content I18n.t('views.buttons.Favorite')
        
      end 
    end 
  end  
end

