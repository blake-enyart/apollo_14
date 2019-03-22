require 'rails_helper'

describe 'User sees all astronauts', type: :feature do
  describe 'User visits "/astronauts" ' do
    describe '.statistics' do
      it 'displays correct statistics' do
        astronaut_1 = Astronaut.create!(name: "Name_1", age: 1, job: "Job_1")
        astronaut_2 = Astronaut.create!(name: "Name_2", age: 2, job: "Job_2")

        visit astronauts_path

        within(".statistics") do
          expect(page).to have_content('Average Age: 1.5')
        end
      end
    end
  end
end
