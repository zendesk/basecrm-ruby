module BaseCRM
  module Envelope
    def self.wrap(data)
      JSON.dump({data: data})
    end
  end
end
