class Modificator < ApplicationService

  def initialize(attr)
    @attr = attr.to_i
  end

  def call
    (@attr-10)/2
  end

end
