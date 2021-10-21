require 'rails_helper'

RSpec.describe Favorite, type: :model do

  describe "Fonctionnalité Favoris" do
    it "Vérification de la présence des classes User et Post" do
      expect(Favorite).to_not be_nil
    end
  end
end
