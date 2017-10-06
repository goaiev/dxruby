# coding: utf-8

class Player < Sprite
  def update
    self.x += Input.x
    self.y += Input.y
  end

  #ƒ|ƒCƒ“ƒg‰ÁŽZ
  def score(score)
    return score+=1
  end
end
