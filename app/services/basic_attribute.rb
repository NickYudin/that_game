class BasicAttribute < ApplicationService

  def initialize(char_table)

    @at = char_table
    @dependence = {
                        athletics: :strength,
                        acrobatics: :dexterity,
                        sleight_of_hand: :dexterity,
                        stealth: :dexterity,
                        arcana: :intelligence,
                        history: :intelligence,
                        investigation: :intelligence,
                        nature: :intelligence,
                        religion: :intelligence,
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

  def call

    @dependence.each_key do |k|
      mod = Modificator.call(@at.public_send(@dependence[k]))
      if @at.skill
        @at.skill.update(k => mod)
      else
        @at.skill.create(k => mod).save
      end
    end

  end

end
