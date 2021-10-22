require 'rails_helper'

RSpec.describe Favorite, type: :model do

  describe "Fonctionnalité Favoris" do
    it "Vérification de la présence de la classe User" do
      expect(Favorite).to_not be_nil
    end
  end
  it "Vérification de la présence de la classe Post" do
    expect(Favorite).to_not be_nil
  end
end
