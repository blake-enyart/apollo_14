class Astronaut < ApplicationRecord
  has_many :astronaut_missions
  has_many :missions, through: :astronaut_missions

  validates_presence_of :name, :age, :job

  def self.average_age
    average(:age)
  end

  def sort_missions
    missions.pluck(:title).sort
  end

end
