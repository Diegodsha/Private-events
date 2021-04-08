require 'rails_helper'

RSpec.describe EventsController do
    describe "GET index" do
        let(:name) { "simple name" } 
        it 'redirecs to all events' do
        
        #expect(get :index,).to redirect_to(events_path)
      end
    end
  end
  