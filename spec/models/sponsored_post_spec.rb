require 'rails_helper'

RSpec.describe SponsoredPost, type: :model do

  let(:topic) { Topic.create!(name: name, description: description) }
  let(:sponsored_post) { topic.sponsored_posts.create!(title: title, body: body, price: price) }

  it { is_expected.to belong_to(:topic) }


  describe 'attributes' do
    it 'should respond to title' do
      expect(sponsored_post).to respond_to(:title)
    end

    it 'should respond to body' do
      expect(sponsored_post).to respond_to(:body)
    end

    it 'should respond to price' do
      expect(sponsored_post).to respond_to(:price)
    end
  end
end
