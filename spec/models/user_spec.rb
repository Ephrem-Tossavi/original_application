require 'rails_helper'

RSpec.describe User, type: :model do
  describe "User Registration" do
    context "Inscription sans un attribut " do
      it "Ne pas s'inscrire sans email" do
        user = User.new(email: nil, password: "password")
        expect(user).not_to be_valid
      end
      it "Ne pas s'inscrire sans mot de passe" do
        user = User.new(email: "example@test.co", password: nil)
        expect(user).not_to be_valid
      end
      it "Ne pas s'inscrire avec un mauvais e-mail" do
        user = User.new(email: "example.co", password: 'password')
        expect(user).not_to be_valid
      end
      it "Ne pas enregistrer un utilisateur avec un email existant" do
        user = User.new(email: "example.co", password: 'password')
        expect(user).not_to be_valid
      end

    end
    context "S'enregistrer avec succes" do
      it "S'enregistrer avec email et mot de passe" do
        user = User.new(email: "example@test.co", password: "password")
        expect(user).to be_valid
      end
    end
  end
end
