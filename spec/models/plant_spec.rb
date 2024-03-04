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
    before(:each) do
      stub_request(:get, "https://trefle.io/api/v1/plants/search")
        .with(query: { q: Plant.first.name })
        .to_return(status: 404, body: '{}', headers: { 'Content-Type' => 'application/json' })

    end

    subject { Plant.first.trefle_data }

    it do
      expect(subject).to be_instance_of(Hash)
      expect(
        a_request(:get, "https://trefle.io/api/v1/plants/search").with(query: { q: Plant.first.name })
      ).to have_been_made
    end
  end

  describe '#family' do
    subject { Plant.first.family }

    it do
      expect(subject).to be_instance_of(Family)
    end
  end

  describe '#genus' do
    subject { Plant.first.genus }

    it do
      expect(subject).to be_instance_of(Genus)
    end
  end

  describe '#status' do
    subject { Plant.first.status }

    it do
      expect(subject).to be_instance_of(Status)
    end
  end
end