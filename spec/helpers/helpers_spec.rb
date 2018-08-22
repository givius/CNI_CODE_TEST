require 'spec_helper'

describe Cni::NewsSearch::Helpers do

  class HelperTest
    include Cni::NewsSearch::Helpers
  end

  class FakeLogger
    def logger
      'test'
    end
  end

  let(:helper){ HelperTest.new }

  describe '.logger' do
    subject { helper.logger }

    context 'when there is no request' do
      it 'returns nil' do
        expect( subject ).to be_nil
      end
    end

    context 'when there is a request' do
      it 'returns nil' do
        allow( helper ).to receive(:request).and_return( FakeLogger.new )
        expect( subject ).to eq 'test'
      end
    end
  end

  describe '.get_webapp' do
    subject { helper.get_webapp(opts) }
    let(:opts) { {} }

    context 'when on develop mode' do
      it 'returns the erb template' do
        allow( helper ).to receive(:cookies).and_return( {dev_mode: 'true'} )
        allow( helper ).to receive(:erb).with(:index, {:locals => {:dev_mode=>true}}).and_return( 'fake template' )
        expect( subject ).to eq 'fake template'
      end
    end

    context 'when NOT on develop mode' do
      it 'returns the erb template' do
        allow( helper ).to receive(:cookies).and_return( {} )
        allow( helper ).to receive(:erb).with(:index, {:locals => {:dev_mode=>false}}).and_return( 'fake template' )
        expect( subject ).to eq 'fake template'
      end
    end

  end
end