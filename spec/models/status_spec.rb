RSpec.describe Status, type: :model do
  describe '#plants' do
    subject { Status.first.plants }

    it do
      expect(subject).to all(be_instance_of(Plant))
    end
  end
end