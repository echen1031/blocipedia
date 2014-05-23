require 'spec_helper'
require 'stripe_mock'

describe ChargesController do
  before { StripeMock.start }
  after { StripeMock.stop }

  it "creates a stripe customer" do

        # This doesn't touch stripe's servers nor the internet!
     customer = Stripe::Customer.create({
       email: 'johnny@appleseed.com',
       card: 'void_card_token'
     })
      expect(customer.email).to eq('johnny@appleseed.com')
  end

  it "generates a stripe card token" do
      card_token = StripeMock.generate_card_token(last4: "9191", exp_year: 1984)
      cus = Stripe::Customer.create(card: card_token)
      card = cus.cards.data.first
      expect(card.last4).to eq("9191")
      expect(card.exp_year).to eq(1984)
  end

    it 'Update user to premium account' do
      card_token = StripeMock.generate_card_token(last4: "9191", exp_year: 1984)
      user = FactoryGirl.create(:user)
      user.premium.should be_false
      sign_in user
      post :create, amount: 900, stripeToken: card_token
      user.reload
      user.premium.should be_true
    end 
  end
