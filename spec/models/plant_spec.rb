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
        .to_return(status: 404, headers: { 'Content-Type' => 'application/json' })

    end

    subject { Plant.first.trefle_data }

    it do
      expect(subject).to be_instance_of(Hash)
    end
  end
end