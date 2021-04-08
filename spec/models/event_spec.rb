require 'rails_helper'

RSpec.describe Event, :type => :model do
  describe 'An event can be created by a user' do
    let(:name) { 'simple name' }

    it 'event is valid if creator,name, and description exists' do
      user = User.create(name:'creator',)
      event = Event.create(creator: user,name:'event name', description:'description of the event')
      
      expect(event).to be_valid
    end

    it 'event is not valid if creator is not present' do
      user = User.create
      event = Event.create(creator: nil,name:'event name', description:'description of the event')
      
      expect(event).to_not be_valid
    end

    it 'event is not valid if name is not present or less than 2 characters' do
      user = User.create
      event = Event.create(creator: user,name:'', description:'description of the event')
      
      expect(event).to_not be_valid
    end

    it 'event is not valid if description is not present or more than 35 characters' do
      user = User.create
      event = Event.create(creator: nil,name:'event name', description:'')
      event2 = Event.create(creator: nil,name:'event name', description:'description of the event more longer than usual')
      
      expect(event).to_not be_valid
      expect(event2).to_not be_valid  
    end

    it 'event can have many attendees' do
      user = User.create(name:'user')
      user = User.create(name:'user2')
      user = User.create(name:'user3')
      event = Event.create(creator: user,name:'event name', description:'description of the event')
      
      event.attendees.each do |e| 
        expect(event.attendes).to eq(e.name)
      end
    end

    it 'belongs to a user' do
      user = User.create(name:'user3')
      event = Event.create(creator: user,name:'event name', description:'description of the event', creator_id:user.id)
      expect(event.creator_id).to  eq(user.id)
    end
  end
end
