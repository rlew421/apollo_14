require 'rails_helper'

describe Astronaut, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
    it { should validate_presence_of :job }
  end

  describe 'Relationships' do
    it { should have_many :astronaut_missions}
    it { should have_many :missions}
  end

  describe "class methods" do
    it ".average_age" do
      neil_armstrong = Astronaut.create(name: "Neil Armstrong", age: 37, job: "Commander")
      buzz_aldrin = Astronaut.create(name: "Buzz Aldrin", age: 35, job: "Pilot")
      michael_collins = Astronaut.create(name: "Michael Collins", age: 32, job: "Test Pilot")

      expect(Astronaut.average_age).to eq(34.67)
    end
  end
end
