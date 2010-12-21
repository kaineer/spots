# Spot in the div
#

class Spot
  include DataMapper::Resource

  property :id,     Serial
  property :left,   Integer
  property :top,    Integer
  property :width,  Integer
  property :height, Integer
  property :color,  String

  def to_html
    "<div class='spot' style='position: absolute; left: #{self.left}px; top: #{self.top}px;" + 
      " width: #{self.width}px; height: #{self.height}px; background-color: #{self.color};' " +
      " name='#{self.id}'></div>"
  end
end
