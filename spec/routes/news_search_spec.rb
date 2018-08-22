require 'spec_helper'

describe Cni::SinatraApps::NewsSearch do
  def app
    Cni::SinatraApps::NewsSearch
  end

  let(:json_request){ { content_type: :json, accept: :json } }
  subject(:response){ JSON.parse(route.body) }

  describe "GET /latest_news" do
    subject(:route){ get "/latest_news" }

    context 'when there is an error on the rest call' do
      it "should throw an error" do
        RestClient.stub(:get).and_return( {message: 'boom'}.to_json )
        expect( route.status ).to eq 404
        expect( route.body ).to eq "boom"
      end
    end

    context 'when rest call returns a valid response' do
      it "returns the articles" do
        RestClient.stub(:get).and_return( {status: 'ok', articles: [1,2,3]}.to_json )
        expect( response ).to match_array [1,2,3]
      end
    end

    context "when raising an error" do
      it "should be trapped" do
        RestClient.stub(:get).and_raise 'boom'
        expect( route.status ).to eq 500
        expect( route.body ).to eq "boom"
      end
    end
  end

  describe "POST /search" do
    subject(:route){ post "/search", payload, json_request }

    context 'when keyword is missing' do
      let(:payload) { {} }

      it 'returns an empty array' do
        expect(response).to eq []
      end
    end

    context 'when keyword is passed' do
      let(:payload) { {keyword: 'ABC'} }

      context 'when there is an error on the rest call' do
        it "should throw an error" do
          RestClient.stub(:get).and_return( {message: 'boom'}.to_json )
          expect( route.status ).to eq 404
          expect( route.body ).to eq "boom"
        end
      end

      context 'when rest call returns a valid response' do
        it "returns the articles" do
          RestClient.stub(:get).and_return( {status: 'ok', articles: [1,2,3]}.to_json )
          expect( response ).to match_array [1,2,3]
        end
      end

      context "when raising an error" do
        it "should be trapped" do
          RestClient.stub(:get).and_raise 'boom'
          expect( route.status ).to eq 500
          expect( route.body ).to eq "boom"
        end
      end
    end
  end
end