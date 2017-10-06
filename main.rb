# coding: utf-8
require 'dxruby'

require_relative 'player'
require_relative 'enemy'
require_relative 'back'

Window.width  = 800
Window.height = 600
point=0
i=0
clear=0
font = Font.new(32)
back1 = Image.load('image/shibafu.png') #背景
back2 = Image.load('image/sky.jpg')
back3 = Image.load('image/hato.png')
back4 = Image.load('image/omedetou.png')

player_img = Image.load("image/player.png")
#player_img.setColorKey([255, 255, 255])

enemy_img1 = Image.load("image/pink.png")
enemy_img2 = Image.load("image/purple.png")
enemy_img3 = Image.load("image/skyblue.png")
enemy_img4 = Image.load("image/yellow.png")
enemy_img5 = Image.load("image/yellowgreen.png")

bomb = Image.load("image/bakudan.png")
#enemy_img.setColorKey([0, 0, 0])

player = Player.new(400, 450, player_img)

enemies = []
bombs = []
#10.times do |i|
#  enemies << Enemy.new(rand(800), rand(600), enemy_img1)
#  enemies << Enemy.new(rand(800), rand(600), enemy_img2)
#  enemies << Enemy.new(rand(800), rand(600), enemy_img3)
#  enemies << Enemy.new(rand(800), rand(600), enemy_img4)
#  enemies << Enemy.new(rand(800), rand(600), enemy_img5)
#end

Window.loop do
  break if Input.keyPush?(K_ESCAPE)
  Window.draw(0, 0, back1)
  Window.draw(400, 0, back1)
  Window.draw(0, 400, back1)
  Window.draw(400, 400, back1)
  i+=1

  if i%50==0
    enemies << Enemy.new(rand(800), rand(600), enemy_img1)
    enemies << Enemy.new(rand(800), rand(600), enemy_img2)
    enemies << Enemy.new(rand(800), rand(600), enemy_img3)
    enemies << Enemy.new(rand(800), rand(600), enemy_img4)
    enemies << Enemy.new(rand(800), rand(600), enemy_img5)
    if(i%100==0)
      bombs << Enemy.new(rand(800), rand(600), bomb)
    end
  end

  Sprite.update(enemies)
  Sprite.draw(enemies)

  Sprite.update(bombs)
  Sprite.draw(bombs)

  player.update
  player.draw
  Window.draw_font(100, 100, "point=#{point}", font)

  # 当たり判定
  res=Sprite.check(player, enemies)
  if res
    point=player.score(point)
  end
  res=Sprite.check(player, bombs)
  if res
    point=0
  end

  if point >= 50
    clear=1
    break
  end

end

if clear==1
  hato = Back.new(400, 450, back3)
  Window.loop do
    Window.draw(0, 0, back2)
    Window.draw(150, 200, back4,3)
    hato.update
    hato.draw
  end
end
