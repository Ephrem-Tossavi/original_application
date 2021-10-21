require 'rails_helper'

RSpec.describe Tagging, type: :model do
  describe "Fonctionnalité Tagging" do
    it "Vérification de la présence des classes Tag et Post" do
      expect(Tagging).to_not be_nil
    end
  end
end
