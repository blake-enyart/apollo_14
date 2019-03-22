require 'rails_helper'

describe 'User sees all astronauts', type: :feature do
  describe 'User visits "/astronauts" ' do
    it 'displays all astronauts' do
      astronaut_1 = Astronaut.create!(name: "Name_1", age: 1, job: "Job_1")
      astronaut_2 = Astronaut.create!(name: "Name_2", age: 2, job: "Job_2")

      visit astronauts_path

      expect(page).to have_content("Name: #{astronaut_1.name}")
      expect(page).to have_content("Age: #{astronaut_1.age}")
      expect(page).to have_content("Job: #{astronaut_1.job}")
      
      expect(page).to have_content("Name: #{astronaut_2.name}")
      expect(page).to have_content("Age: #{astronaut_2.age}")
      expect(page).to have_content("Job: #{astronaut_2.job}")
    end
  end
end


# As a visitor,
# When I visit '/astronauts'
# I see a list of astronauts with the following info:
# - Name
# - Age
# - Job
#
# (e.g. "Name: Neil Armstrong, Age: 37, Job: Commander")
