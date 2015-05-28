require 'spec_helper'

describe BaseCRM::SyncService do
  let(:device_uuid) { '6dadcec8-6e61-4691-b318-1aab27b8fecf' }
  let(:session_id) { '29f2aeeb-8d68-4ea7-95c3-a2c8e151f5a3' }

  describe 'Responds to' do
    subject { BaseCRM::SyncService.new(double) }

    it { should respond_to :start }
    it { should respond_to :ack }
    it { should respond_to :fetch }
  end

  describe 'Client respond to' do
    subject { client }

    it { should respond_to :sync }
  end

  describe 'Client#sync' do
    it 'returns BaseCRM::SyncService instance' do
      expect(client.sync).to be_a BaseCRM::SyncService
    end
  end

  describe :start do
    describe 'validation' do
      context 'device_uuid is nil' do
        it 'raises ArgumentError exception' do
          expect { client.sync.start(nil) }.to raise_error(ArgumentError)
        end
      end

      context 'device_uuid is empty' do
        it 'raises ArgumentError exception' do
          expect { client.sync.start(" ") }.to raise_error(ArgumentError)
        end
      end
    end

    context 'nothing new to fetch' do
      let(:http_response) do
        [204, {}, nil]
      end

      it 'returns nil' do
        expect(client.http_client).to receive(:post).with('/sync/start', {}, {'X-Basecrm-Device-UUID' => device_uuid}).and_return(http_response)
        expect(client.sync.start(device_uuid)).to be_nil
      end
    end

    context 'we have to data to synchronize' do
      let(:payload) do
        {
          data: {
            id: session_id,
            queues: [
              data: {
                name: 'main',
                pages: 1,
                total_count: 2
              },
              meta: {
                type: :sync_queue
              }
            ]
          },
          meta: {
            type: :sync_session
          }
        }
      end

      let(:http_response) do
        [201, {}, payload]
      end

      before :each do
        expect(client.http_client).to receive(:post).with('/sync/start', {}, {'X-Basecrm-Device-UUID' => device_uuid}).and_return(http_response)
      end

      it 'returns an instance of BaseCRM::SyncSession' do
        expect(client.sync.start(device_uuid)).to be_an BaseCRM::SyncSession
      end

      it "flattens BaseCRM::SyncSession's queues" do
        client.sync.start(device_uuid).queues.each do |queue|
          expect(queue).to be_an BaseCRM::SyncQueue
        end
      end
    end
  end

  describe :ack do
    let(:http_response) do
      [202, {}, nil]
    end

    let(:ack_keys) do
      ['User-1234-1', 'Source-1234-1']
    end

    describe 'validation' do
      context 'device_uuid is nil' do
        it 'raises ArgumentError exception' do
          expect { client.sync.ack(nil, ack_keys) }.to raise_error(ArgumentError)
        end
      end

      context 'device_uuid is empty' do
        it 'raises ArgumentError exception' do
          expect { client.sync.ack(" ", ack_keys) }.to raise_error(ArgumentError)
        end
      end

      context 'ack_keys is nil' do
        it 'raises ArgumentError exception' do
          expect { client.sync.ack(device_uuid, nil) }.to raise_error(ArgumentError)
        end
      end

      context 'ack_keys is not an Array' do
        it 'raises ArgumentError exception' do
          expect { client.sync.ack(device_uuid, {}) }.to raise_error(ArgumentError)
        end
      end
    end

    context 'empty ack_keys array' do
      let(:ack_keys) do
        []
      end

      it 'returns imedieatly with true value' do
        expect(client.http_client).not_to receive(:post)
        expect(client.sync.ack(device_uuid, ack_keys)).to eq(true)
      end
    end

    context 'non empty ack_keys call' do
      it 'returns true value' do
        expect(client.http_client).to receive(:post).with('/sync/ack', {ack_keys: ack_keys}, {'X-Basecrm-Device-UUID' => device_uuid}).and_return(http_response)
        expect(client.sync.ack(device_uuid, ack_keys)).to eq(true)
      end
    end
  end

  describe :fetch do
    context 'validation' do
      context 'device_uuid is nil' do
        it 'raises ArgumentError exception' do
          expect { client.sync.fetch(nil, session_id) }.to raise_error(ArgumentError)
        end
      end

      context 'device_uuid is empty' do
        it 'raises ArgumentError exception' do
          expect { client.sync.fetch(" ", session_id) }.to raise_error(ArgumentError)
        end
      end

      context 'session_id is nil' do
        it 'raises ArgumentError exception' do
          expect { client.sync.fetch(device_uuid, nil) }.to raise_error(ArgumentError)
        end
      end

      context 'session_id is empty' do
        it 'raises ArgumentError exception' do
          expect { client.sync.fetch(device_uuid, ' ') }.to raise_error(ArgumentError)
        end
      end

      context 'queue names is nil' do
        it 'raises ArgumentError exception' do
          expect { client.sync.fetch(device_uuid, session_id, nil) }.to raise_error(ArgumentError)
        end
      end

      context 'queue names is empty' do
        it 'raises ArgumentError exception' do
          expect { client.sync.fetch(device_uuid, session_id, ' ') }.to raise_error(ArgumentError)
        end
      end
    end

    context 'no more data to fetch' do
      let(:http_response) do
        [204, {}, nil]
      end

      it 'returns an empty array' do
        expect(client.http_client).to receive(:get).with("/sync/#{session_id}/queues/main", {}, {'X-Basecrm-Device-UUID' => device_uuid}).and_return(http_response)
        expect(client.sync.fetch(device_uuid, session_id)).to eq([])
      end
    end

    context 'there is still data in the main queue' do
      let(:payload) do
        {
          items: [
            {
              data: {
                id: 1
              },
              meta: {
                type: 'user',
                sync: {
                  event_type: 'created',
                  ack_key: 'User-123-1',
                  revision: 1
                }
              }
            },
            {
              data: {
                id: 1
              },
              meta: {
                type: 'source',
                sync: {
                  event_type: 'created',
                  ack_key: 'Source-123-1',
                  revision: 1
                }
              }
            }
          ],
          meta: {
            type: 'collection',
            count: 2,
            count_left: 0
          }
        }
      end

      let(:http_response) do
        [200, {}, payload]
      end

      before :each do
        expect(client.http_client).to receive(:get).with("/sync/#{session_id}/queues/main", {}, {'X-Basecrm-Device-UUID' => device_uuid}).and_return(http_response)
      end

      it 'returns an array' do
        expect(client.sync.fetch(device_uuid, session_id)).to be_an Array
      end

      it 'returns a non empty array' do
        expect(client.sync.fetch(device_uuid, session_id)).not_to be_empty
      end

      it 'returns an array of two items' do
        expect(client.sync.fetch(device_uuid, session_id).length).to eq(2)
      end

      it 'returns an array of arrays' do
        client.sync.fetch(device_uuid, session_id).each do |item|
          expect(item).to be_an Array
          expect(item).not_to be_empty
          expect(item.length).to eq(2)
        end
      end

      it 'returns an array where the first element is BaseCRM::SyncMeta and the second is a model' do
        items = client.sync.fetch(device_uuid, session_id)

        sync_meta, user = items[0]
        expect(sync_meta).to be_a BaseCRM::SyncMeta
        expect(user).to be_a BaseCRM::User
        expect(sync_meta.ack_key).to eq('User-123-1')
        expect(user.id).to eq(1)

        sync_meta, source = items[1]
        expect(sync_meta).to be_a BaseCRM::SyncMeta
        expect(source).to be_a BaseCRM::Source
        expect(sync_meta.ack_key).to eq('Source-123-1')
        expect(source.id).to eq(1)
      end
    end
  end
end
