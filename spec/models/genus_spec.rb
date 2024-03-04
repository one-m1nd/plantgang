RSpec.describe Genus, type: :model do
  describe '#families' do
    subject { Genus.first.families }

    it do
      expect(subject).to all(be_instance_of(Family))
    end
  end

  describe '#plants' do
    subject { Genus.first.plants }

    it do
      expect(subject).to all(be_instance_of(Plant))
    end
  end
end