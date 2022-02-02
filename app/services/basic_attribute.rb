class BasicAttribute < ApplicationService

  def initialize(abil_table)
    @at = AbilityTable.find(abil_table.id)
    @dependence = SkillsHash.call
  end

  def call

    @dependence.each_key do |k|
      mod = Modificator.call(@at.public_send(@dependence[k]))
      @at.skill.update(k => mod)
    end

  end

end
