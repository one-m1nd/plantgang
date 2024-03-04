RSpec.describe Family, type: :model do
  describe '#trefle_data' do
    before(:each) do
      stub_request(:get, "https://trefle.io/api/v1/families/familyone")
        .to_return(status: 404, body: '{}', headers: { 'Content-Type' => 'application/json' })
    end

    subject { Family.first.trefle_data }

    it do
      expect(subject).to be_instance_of(Hash)
      expect(
        a_request(:get, "https://trefle.io/api/v1/families/familyone")
      ).to have_been_made
    end
  end

  describe '#genera' do
    subject { Family.first.genera }

    it do
      expect(subject).to all(be_instance_of(Genus))
    end
  end

  describe '#plants' do
    subject { Family.first.plants }

    it do
      expect(subject).to all(be_instance_of(Plant))
    end
  end
end