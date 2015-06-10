require 'spec_helper'

describe BaseCRM::Sync do
  let(:device_uuid) { '6dadcec8-6e61-4691-b318-1aab27b8fecf' }
  let(:session_id) { '29f2aeeb-8d68-4ea7-95c3-a2c8e151f5a3' }

  subject { BaseCRM::Sync.new(device_uuid: device_uuid, client: client) }

  describe 'Responds to' do
    it { should respond_to :fetch }
  end

  describe :initialize do
    describe 'validation' do
      context 'no device_uuid option' do
        it 'raises BaseCRM::ConfigurationError exception' do
          expect { BaseCRM::Sync.new(client: client) }.to raise_error BaseCRM::ConfigurationError
        end
      end

      context 'no client option' do
        it 'raises BaseCRM::ConfigurationError exception' do
          expect { BaseCRM::Sync.new(device_uuid: device_uuid) }.to raise_error BaseCRM::ConfigurationError
        end
      end

      context 'required options passed' do
        it 'raises no exception' do
          expect { BaseCRM::Sync.new(client: client, device_uuid: device_uuid) }.not_to raise_error
        end
      end
    end
  end

  describe :fetch do
    context 'no block passed' do
      it 'does nothing' do
        expect(client).not_to receive(:sync)
        subject.fetch
      end
    end

    context 'nothing to synchronize' do
      before :each do
        expect(client.sync).to receive(:start).with(device_uuid).and_return(nil)
      end

      it 'returns early' do
        expect(subject.fetch { |s, r| :nop }).to be_nil
      end
    end

    context 'fresh data to synchronize' do
      let(:session) do
        BaseCRM::SyncSession.new(id: session_id)
      end

      let(:ack_keys) do
        ['User-1234-1', 'Source-1234-1']
      end

      let(:queue_items) do
        [
          [BaseCRM::Meta.new(type: 'user', sync: BaseCRM::SyncMeta.new(event_type: 'created', ack_key: 'User-1234-1')), BaseCRM::User.new(id: 1)],
          [BaseCRM::Meta.new(type: 'source', sync: BaseCRM::SyncMeta.new(event_type: 'created', ack_key: 'Source-1234-1')), BaseCRM::Source.new(id: 1)]
        ]
      end

      before :each do
        expect(client.sync).to receive(:start).with(device_uuid).and_return(session)
        expect(client.sync).to receive(:fetch).with(device_uuid, session_id).and_return(queue_items)
        expect(client.sync).to receive(:fetch).with(device_uuid, session_id).and_return([])
        expect(client.sync).to receive(:ack).with(device_uuid, ack_keys).and_return(true)
      end

      it 'does whole synchronization flow' do
        subject.fetch { |m, r| m.sync.ack }
      end

      it 'calls a provided block as many times as items in the queue' do
        counter = 0
        subject.fetch { |m, r| counter += 1; m.sync.ack }
        expect(counter).to eq(2)
      end

      it 'passes two elements to provided block: first element is BaseCRM::SyncMeta and the second is a resource' do
        subject.fetch do |m, r|
          expect(m).to be_a BaseCRM::Meta
          expect(m.sync).to be_a BaseCRM::SyncMeta
          m.sync.ack
        end
      end
    end
  end
end
