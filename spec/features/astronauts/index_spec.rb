require 'rails_helper'

RSpec.describe "astronaut index page" do
  it "I can see a list of astronauts and their name, age, and job from the index page" do
    neil_armstrong = Astronaut.create(name: "Neil Armstrong", age: 37, job: "Commander")
    buzz_aldrin = Astronaut.create(name: "Buzz Aldrin", age: 35, job: "Pilot")
    michael_collins = Astronaut.create(name: "Michael Collins", age: 32, job: "Test Pilot")

    visit'/astronauts'

    expect(page).to have_content("Name: #{neil_armstrong.name}")
    expect(page).to have_content("Age: #{neil_armstrong.age}")
    expect(page).to have_content("Job: #{neil_armstrong.job}")
    expect(page).to have_content("Name: #{buzz_aldrin.name}")
    expect(page).to have_content("Age: #{buzz_aldrin.age}")
    expect(page).to have_content("Job: #{buzz_aldrin.job}")
    expect(page).to have_content("Name: #{michael_collins.name}")
    expect(page).to have_content("Age: #{michael_collins.age}")
    expect(page).to have_content("Job: #{michael_collins.job}")
    expect(page).to have_content("Average age: 34.67")
  end
end
