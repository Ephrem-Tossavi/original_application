require 'rails_helper'

RSpec.describe Tagging, type: :model do
  describe "Fonctionnalité Tagging" do
    it "Vérification de la présence de la classe Tag " do
      expect(Tagging).to_not be_nil
    end
  end
  it "Vérification de la présence de la classe Post" do
    expect(Tagging).to_not be_nil
  end
end
