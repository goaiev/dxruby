class Back < Sprite
  #クリア画面の鳩を表示するクラス 
  def update
    self.x -= 1
    self.y -= 1
    if self.y <=  - self.image.height && self.x <= - self.image.width
      self.x = Window.width
      self.y = Window.height
    end
  end
end
