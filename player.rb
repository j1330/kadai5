# coding: utf-8

class Player < Sprite
  def update
      self.x += Input.x*3
      self.y += Input.y*3
      if self.x <= 0
	self.x = 0
      end
      if self.x >= Window.width - self.image.width
         self.x = Window.width - self.image.width
      end
      if self.y <= 0
         self.y = 0
      end
      if self.y >= Window.height - self.image.height
         self.y = Window.height - self.image.height
      end
  end
end