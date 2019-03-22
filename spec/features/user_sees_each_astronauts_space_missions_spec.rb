require 'rails_helper'

describe 'User sees all astronauts', type: :feature do
  describe 'User visits "/astronauts" ' do
    describe '.astronaut-ctn' do
      it 'displays sorted mission names' do
        astronaut_1 = Astronaut.create!(name: "Name_1", age: 1, job: "Job_1")
        astronaut_2 = Astronaut.create!(name: "Name_2", age: 2, job: "Job_2")

        mission_1 = astronaut_1.missions.create!(title: "Title_1", time_in_space: 1)
        mission_2 = astronaut_1.missions.create!(title: "Title_2", time_in_space: 2)
        mission_3 = astronaut_1.missions.create!(title: "Title_3", time_in_space: 3)

        mission_4 = astronaut_2.missions.create!(title: "Title_4", time_in_space: 4)
        mission_5 = astronaut_2.missions.create!(title: "Title_5", time_in_space: 5)
        mission_6 = astronaut_2.missions.create!(title: "Title_6", time_in_space: 6)

        visit astronauts_path

        within(".astronaut-ctn") do
          expect(page).to have_content(mission_1.title)
          expect(page).to have_content(mission_2.title)
          expect(page).to have_content(mission_3.title)
          expect(page).to have_content(mission_4.title)
          expect(page).to have_content(mission_5.title)
          expect(page).to have_content(mission_6.title)
        end
      end
    end
  end
end
