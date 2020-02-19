require 'rails_helper'
require 'spec_helper'

RSpec.describe PigLatinController do 
	describe "POST piglatin" do
		let(:post_request) { post :translate, :params => params }

		context 'when sending correct params over' do
			let(:params) { {'words' => "hello"} }
			it "returns status 200" do
				post_request
				expect(response).to have_http_status(200)
			end

			it "returns ellohay" do
				post_request
				expect(JSON.parse(response.body)['translated']).to eq('ellohay')
			end
		end

		context 'when sending word "eat"' do
			let(:params) { {'words' => "eat"} }
			it "returns eatway" do
				post_request
				expect(JSON.parse(response.body)['translated']).to eq('eatway')
			end
		end

		context 'when sending word "yellow"' do
			let(:params) { {'words' => "yellow"} }
			it "returns yellowway" do
				post_request
				expect(JSON.parse(response.body)['translated']).to eq('yellowway')
			end
		end
		
		context 'when sending words "eat world"' do
			let(:params) { {'words' => "eat world"} }
			it "returns eatway orldway" do
				post_request
				expect(JSON.parse(response.body)['translated']).to eq('eatway orldway')
			end
		end

		context 'when sending word "Apples"' do
			let(:params) { {'words' => "Apples"} }
			it "returns Applesway" do
				post_request
				expect(JSON.parse(response.body)['translated']).to eq('Applesway')
			end
		end

		context 'when sending words "eat... world?!"' do
			let(:params) { {'words' => "eat... world?!"} }
			it "returns eatway... orldway?!" do
				post_request
				expect(JSON.parse(response.body)['translated']).to eq('eatway... orldway?!')
			end
		end

		context 'when sending word "school"' do
			let(:params) { {'words' => "school"} }
			it "returns oolschay" do
				post_request
				expect(JSON.parse(response.body)['translated']).to eq('oolschay')
			end
		end

		context 'when sending word "quick"' do
			let(:params) { {'words' => "quick"} }
			it "returns ickquay" do
				post_request
				expect(JSON.parse(response.body)['translated']).to eq('ickquay')
			end
		end

		context 'when sending words "she’s great!"' do
			let(:params) { {'words' => "she’s great!"} }
			it "returns e’sshay eatgray!" do
				post_request
				expect(JSON.parse(response.body)['translated']).to eq('e’sshay eatgray!')
			end
		end

		context 'when sending words "HELLO"' do
			let(:params) { {'words' => "HELLO"} }
			it "returns ELLOHAY" do
				post_request
				expect(JSON.parse(response.body)['translated']).to eq('ELLOHAY')
			end
		end		

		context 'when sending words "Hello There"' do
			let(:params) { {'words' => "Hello There"} }
			it "returns Ellohay Erethay" do
				post_request
				expect(JSON.parse(response.body)['translated']).to eq('Ellohay Erethay')
			end
		end		

		context 'when sending over bad parameter' do
			let(:params) { {'name' => 'Jordan'} }
			it 'returns parameter missing error' do
				post_request
        expect(response).to have_http_status(400)
      end
		end		
		
	end
end