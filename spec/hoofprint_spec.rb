
require_relative '../app/responders/application_responder'


def test_process_message(message)
  puts "in test_process_message with #{message}"
  return {"fake" => "message", "processed" => true}
end

RSpec.describe HoofprintResponder do
  subject(:responder) { described_class.new  }
  describe 'supported topics' do
    describe 'example1' do
      let(:topic) { described_class.topics['example2'] }

      it { expect(topic.name).to eq 'example2' }
      it { expect(topic.required?).to be true }
    end
  end

  describe '#call' do
    # This will actually hit Kafka.
    let(:input_data) { { 'fake' => 'message' } }
    let(:expected_data) {{ 'fake' => 'message', 'processed'=> true }}
    let(:accumulated_data) do
      [[expected_data.to_json, { topic: 'example2' }]]
    end

    it 'expect to add builds to message buffer' do
      responder.call(input_data)
      expect(responder.messages_buffer['example2']).to eq accumulated_data
    end
  end
end