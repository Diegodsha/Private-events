require 'rails_helper'

RSpec.describe Event, type: :model do
  let(:name) { 'simple name' }
  describe 'An event can be created by a user and if it has all the validations' do
    it 'belongs to a user' do
      user = User.create(name: 'user3')
      event = Event.create(creator: user, name: 'event name', description: 'description of the event', creator_id: user.id)

      expect(event.creator_id).to eq(user.id)
    end

    it 'event is not valid ' do
      event = Event.create(creator: nil, name: 'event name', description: 'description of the event')

      expect(event).to_not be_valid
    end
  end

  it 'event is not valid' do
    user = User.create
    event = Event.create(creator: user, name: '', description: 'description of the event')
    event2 = Event.create(creator: user, name: 'event name', description: 'description of the event more longer than usual')

    expect(event).to_not be_valid
    expect(event2).to_not be_valid
  end

  it 'event can have many attendees' do
    creator = User.create(name: 'creator')
    attendee1 = User.create(name: 'attendee1')
    attendee2 = User.create(name: 'attendee2')

    event = Event.create(creator: creator, name: 'event name', description: 'description of the event')
    event.attendees = [attendee1, attendee2]
    event.save

    saved_event = Event.find(event.id)
    expect(saved_event.attendees.size).to eq(2)
  end
end
