# coding: utf-8
require 'dxruby'

require_relative 'player'
require_relative 'enemy'
require_relative 'enemy2'

Window.width  = 800
Window.height = 600
point = 0
time=0
font = Font.new(32)
font2 = Font.new(90)
state = 1

player_img = Image.load("gorilla.png")
player_img.setColorKey([0, 0, 0])
player_img2 = Image.load("gorilla2.png")
player_img2.setColorKey([0, 0, 0])

enemy_img = Image.load("banana.png")
enemy_img.setColorKey([0, 0, 0])
enemy_img2 = Image.load("banana_kawa.png")
enemy_img2.setColorKey([0, 0, 0])
enemy_img3 = Image.load("ryoushi.png")
enemy_img3.setColorKey([0, 0, 0])
haikei_img = Image.load("haikei.png")
haikei_img.setColorKey([0,0,0])
player = Player.new(400, 500, player_img)

enemies = []
enemies2 = []
enemies3 = []

Window.loop do
#Input.keyPush?(K_ESCAPE)
 if point >= 150
    state = 0
     Window.draw(0,0,haikei_img)
     Window.draw_font(10,100,"クリア",font2)
     Window.draw_font(100,500,"終了：SPACEキー",font2)
     Window.draw(300,300,player_img2)
     if Input.keyPush?(K_SPACE)
        break
     end
 end
 if state==1
 if time%15 == 0
 enemies << Enemy.new(rand(780), 50, enemy_img)
 end
 if time%120 == 0
   enemies2 << Enemy2.new(rand(780), 50, enemy_img2)
 end
 if time%40 == 0
   enemies3 << Enemy2.new(rand(780), 50, enemy_img3)
 end
  Sprite.update(enemies)
  Sprite.draw(enemies)
  Sprite.update(enemies2)
  Sprite.draw(enemies2)
  Sprite.update(enemies3)
  Sprite.draw(enemies3)
  player.update
  player.draw

  # 当たり判定
  if Sprite.check(player, enemies)
	point += 5
  end
  if Sprite.check(player, enemies2)
	point += 30
  end

  if Sprite.check(player, enemies3)
	point -= 50
  end

  Window.draw_font(10,10,"バナナポイント:#{point}",font)
  time+=1
 end
end