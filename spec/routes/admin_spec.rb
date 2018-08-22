require 'spec_helper'

describe Cni::SinatraApps::Admin do
  def app
    Cni::SinatraApps::Admin
  end

  describe "GET /" do
    subject(:route){ get "/" }

    it 'should call the get_webapp helper method' do
      allow_any_instance_of(app).to receive(:get_webapp).once
      subject
    end

    it 'returns the page content ' do
      allow_any_instance_of(app).to receive(:get_webapp).and_return('news test')
      expect( route.body ).to eq 'news test'
    end

    context "when raising an error" do
      it "should be trapped" do
        allow_any_instance_of(app).to receive(:get_webapp).and_raise "boom"
        expect( route.status ).to eq 500
        expect( route.body ).to eq "boom"
      end
    end
  end
end