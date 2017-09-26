# coding: utf-8

class Enemy2 < Sprite
  def update
    self.y += 4
    if self.y >= Window.height - self.image.height
      self.vanish
    end
  end

  def hit(obj)
    self.vanish
  end
end