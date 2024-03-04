RSpec.describe Plant, type: :model do
  describe '.dead' do
    subject { Plant.dead }

    it do
      expect(subject.all?{ |plant| plant.status.name == 'Dead' }).to be true
    end
  end

  describe '.alive' do
    subject { Plant.alive }

    it do
      expect(subject.all?{ |plant| plant.status.name == 'Alive' }).to be true
    end
  end

  describe '#trefle_data' do
    it do
    end

  end
end