RSpec.describe Watertracker, type: :model do
  describe '#next_date' do
    subject { Watertracker.next_date }

    it do
      expect(subject).to be_instance_of(Date)
    end
  end
end