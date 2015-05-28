require 'spec_helper'

describe BaseCRM::SyncMeta do
  describe 'Responds to' do
    it { should respond_to :ack }
    it { should respond_to :nack }
    it { should respond_to :acknowledged? }
  end

  describe :ack do
    subject { BaseCRM::SyncMeta }

    it 'returns array' do
      expect(subject.new.ack).to be_an Array
    end

    it 'returns two elements array' do
      expect(subject.new(ack_key: "123").ack).to eq([:ack, "123"])
    end
  end

  describe :nack do
    subject { BaseCRM::SyncMeta }

    it 'returns array' do
      expect(subject.new.nack).to be_an Array
    end

    it 'returns two elements array' do
      expect(subject.new(ack_key: "123").nack).to eq([:nack, "123"])
    end
  end

  describe :acknowledged? do
    subject { BaseCRM::SyncMeta }

    context 'neither ack nor nack method called' do
      it 'return false value' do
        expect(subject.new.acknowledged?).to eq(false)
      end
    end

    context 'ack method called' do
      it 'return true value' do
        ack_meta = subject.new
        ack_meta.ack
        expect(ack_meta.acknowledged?).to eq(true)
      end
    end

    context 'nack method called' do
      it 'return true value' do
        ack_meta = subject.new
        ack_meta.nack
        expect(ack_meta.acknowledged?).to eq(true)
      end
    end
  end
end
