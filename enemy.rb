# coding: utf-8

class Enemy < Sprite
  def update
    self.y += 1
    if self.y >= Window.height - self.image.height
      self.vanish
    end
  end
  # ���̃I�u�W�F�N�g�����Փ˂��ꂽ�ۂɌĂ΂��郁�\�b�h
  def hit(obj)
    self.vanish
  end

end
