class Parser

  CLASSES_START_PAGE  = 'https://www.dandwiki.com/wiki/5e_SRD:Classes'.freeze
  RACES_START_PAGE  = 'https://www.dandwiki.com/wiki/5e_SRD:races'.freeze

  def initialize(source)
    if source == "classes"
      start_page = CLASSES_START_PAGE
    elsif source == "races"
      start_page = RACES_START_PAGE
    end
    @page = Mechanize.new.get(start_page)
  end

  def links
    @links ||= @page.links.filter_map { |link| link if link.uri.to_s.include?('wiki/5e_SRD:') && link.text.to_s.split(' ').size < 2 && link.text.to_s != 'SRD'}
  end

  def races_data
    links.map { |link| ChRace.new(link).call}
  end

  def chars_data
    links.map { |link| ChCl.new(link).call}
  end

end


class ChRace
  def initialize(link)
    @link = link
    @race = link.click
  end

  def call
    hh = {
          name: racename,
          speed: speed,
          race_increase: ability_score_increase,
          special_rule: @special_rule
        }
  end

  def racename
    @link.text
  end

  def speed
    @race.css('p').text.split(' speed is ')[1].split(' feet')[0].to_i
  end

  def ability_score_increase
    asi = @race.css('p').text.split('Ability Score Increase. ')[1].split('.')[0].split(', and ')
    # Sample output => [Your Dexterity score increases by 2, your Charisma score increases by 2]
    @hh = {}
    asi.map do |m|
      kek = m.split(' ')
      if kek[1] == "other"
        @special_rule = "add_free_points"
      elsif kek[1] == "ability"
      @hh = {
              strength: 1,
              dexterity: 1,
              constitution: 1,
              intelligence: 1,
              wisdom: 1,
              charisma: 1
            }
      else
        @hh[kek[1].downcase.to_sym] = kek.last.to_i
      end
    end
    @hh
  end

end


class ChCl

  def initialize(link)
    @link = link
    @char = link.click
  end

  def call
    hh = {
          name: classname,
          hit_dice_id: hit_dice_id
        }
  end

  def classname
    @link.text
  end

  def hit_dice
    @char.css('p').text.split('Hit Dice: 1d')[1].split(' per')[0].to_i
  end

  def hit_dice_id
    HitDice.find_by(face: hit_dice).id
  end

end

