# coding: utf-8

class Enemy < Sprite
  def update
    self.y += 1
    if self.y >= Window.height - self.image.height
      self.vanish
    end
  end
  #当たったら消える
  def hit(obj)
    self.vanish
  end

end
