class SkillsHash < ApplicationService

 #shows skill's dependence on ability
  def call
    hh = {
          athletics: :strength,
          acrobatics: :dexterity,
          sleight_of_hand: :dexterity,
          stealth: :dexterity,
          arcana: :intelligence,
          history: :intelligence,
          investigation: :intelligence,
          nature: :intelligence,
          religion: :intelligence,
          perception: :intelligence,
          animal_handling: :wisdom,
          insight: :wisdom,
          medicine: :wisdom,
          survival: :wisdom,
          deception: :charisma,
          intimidation: :charisma,
          performance: :charisma,
          persuasion: :charisma
        }
  end

end
