require 'rails_helper'

RSpec.describe "astronaut index page" do
  it "I can see a list of astronauts and their name, age, and job from the index page" do
    neil_armstrong = Astronaut.create(name: "Neil Armstrong", age: 37, job: "Commander")
    buzz_aldrin = Astronaut.create(name: "Buzz Aldrin", age: 35, job: "Pilot")
    michael_collins = Astronaut.create(name: "Michael Collins", age: 32, job: "Test Pilot")
    visit '/astronauts'

    expect(page).to have_content("Name: #{neil_armstrong.name}")
    expect(page).to have_content("Age: #{neil_armstrong.age}")
    expect(page).to have_content("Job: #{neil_armstrong.job}")
    expect(page).to have_content("Name: #{buzz_aldrin.name}")
    expect(page).to have_content("Age: #{buzz_aldrin.age}")
    expect(page).to have_content("Job: #{buzz_aldrin.job}")
    expect(page).to have_content("Name: #{michael_collins.name}")
    expect(page).to have_content("Age: #{michael_collins.age}")
    expect(page).to have_content("Job: #{michael_collins.job}")
  end

  it "I can see the average age of the astronauts" do
    neil_armstrong = Astronaut.create(name: "Neil Armstrong", age: 37, job: "Commander")
    buzz_aldrin = Astronaut.create(name: "Buzz Aldrin", age: 35, job: "Pilot")
    michael_collins = Astronaut.create(name: "Michael Collins", age: 32, job: "Test Pilot")
    visit '/astronauts'

    expect(page).to have_content("Average age: 34.67")
  end

  it "I can see a list of the space missions in alphabetical order for each astronaut" do
    apollo_13 = Mission.create!(title: "Apollo 13", time_in_space: 300)
    capricorn_4 = Mission.create!(title: "Capricorn 4", time_in_space: 400)
    gemini_7 = Mission.create!(title: "Gemini 7", time_in_space: 500)
    voyager_1 = Mission.create!(title: "Voyager 1", time_in_space: 600)
    kepler_mission = Mission.create!(title: "Kepler Mission", time_in_space: 800)

    neil_armstrong = Astronaut.create(name: "Neil Armstrong", age: 37, job: "Commander")
    buzz_aldrin = Astronaut.create(name: "Buzz Aldrin", age: 35, job: "Pilot")
    michael_collins = Astronaut.create(name: "Michael Collins", age: 32, job: "Test Pilot")

    apollo_13.astronauts << neil_armstrong
    apollo_13.astronauts << michael_collins
    capricorn_4.astronauts << neil_armstrong
    capricorn_4.astronauts << buzz_aldrin
    gemini_7.astronauts << buzz_aldrin
    gemini_7.astronauts << michael_collins
    kepler_mission.astronauts << neil_armstrong
    kepler_mission.astronauts << buzz_aldrin
    voyager_1.astronauts << michael_collins

    visit '/astronauts'

    within "#astronaut-#{neil_armstrong.id}" do
      expect(page).to have_content("List of missions: #{apollo_13} #{capricorn_4} #{kepler_mission}")
    end

    within "#astronaut-#{buzz_aldrin.id}" do
      expect(page).to have_content("List of missions: #{capricorn_4} #{gemini_7} #{kepler_mission}")
    end

    within "#astronaut-#{michael_collins.id}" do
      expect(page).to have_content("List of missions: #{apollo_13} #{gemini_7} #{voyager_1}")
    end
  end
end
