RSpec.describe ShowSunlightHours do
  describe '.show' do
    let(:body) do
      <<~BODY
{"results":{"sunrise":"2024-03-05T11:10:30+00:00","sunset":"2024-03-05T22:40:57+00:00","solar_noon":"2024-03-05T16:55:44+00:00","day_length":41427,"civil_twilight_begin":"2024-03-05T10:43:54+00:00","civil_twilight_end":"2024-03-05T23:07:33+00:00","nautical_twilight_begin":"2024-03-05T10:11:24+00:00","nautical_twilight_end":"2024-03-05T23:40:03+00:00","astronomical_twilight_begin":"2024-03-05T09:38:43+00:00","astronomical_twilight_end":"2024-03-06T00:12:44+00:00"},"status":"OK","tzid":"UTC"}
      BODY
    end

    before(:each) do
      stub_request(:get, "https://api.sunrise-sunset.org/json")
        .with(query: { formatted: 0, lat: ShowSunlightHours::LAT, lng: ShowSunlightHours::LONG })
        .to_return(status: 200, body: body, headers: {'Content-Type' => 'application/json'})

        end

    subject { ShowSunlightHours.show }

    it do
      expect(subject).to be_instance_of(Hash)
      expect(subject[:hours]).to be_kind_of(Numeric)
      expect(subject[:sunset]).to be_instance_of(Time)
      expect(subject[:sunrise]).to be_instance_of(Time)
      expect(
        a_request(:get, "https://api.sunrise-sunset.org/json")
          .with(query: { formatted: 0, lat: ShowSunlightHours::LAT, lng: ShowSunlightHours::LONG })
      ).to have_been_made
    end
  end
end