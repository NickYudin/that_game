class CharClassParser

  START_PAGE  = 'https://www.dandwiki.com/wiki/5e_SRD:Classes'.freeze

  def initialize
    @page = Mechanize.new.get(START_PAGE)
  end

  def links
    @links ||= @page.links.filter_map { |link| link if link.uri.to_s.include?('wiki/5e_SRD:') && link.text.to_s.split(' ').size < 2 && link.text.to_s != 'SRD'}
  end


  def chars_data
    links.map { |link| Char.new(link).call}
  end

end


class Char

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
    @name = @link.text
  end

  def hit_dice
     @hit_dice = @char.css('p').text.split('Hit Dice: 1d')[1].split(' per')[0].to_i
  end

  def hit_dice_id
    HitDice.find_by(face: hit_dice).id
  end

end

