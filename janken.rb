class Player
  def hand
    puts "数字を入力してください。"
    puts "0:グー, 1:チョキ, 2:パー"
    input_hand = gets.chomp
    while true
      if input_hand.include?("0") || input_hand.include?("1") || input_hand.include?("2")
        return input_hand.to_i
      else
        puts "0〜2の数字を入力してください。"
        puts "0:グー, 1:チョキ, 2:パー"
        input_hand = gets.chomp
      end
    end
  end
end

class Enemy
  def hand
    rand(0..2)
  end
end

class Janken
  def pon(player_hand, enemy_hand)
    janken = ["グー", "チョキ", "パー"]
    puts "相手の手は#{janken[enemy_hand]}です。"
    # Playerクラスの戻り値とEnemyクラスの戻り値からじゃんけんするロジックを作成します。
    while true
      if player_hand == enemy_hand
        puts "あいこ"
        return true
        #「true」を返してじゃんけんを繰り返し実行させます。
        # ヒント：「return」を使って戻り値を返すことができます。しかし、Rubyでは戻り値を返す場合、「return」を省略するのが一般的です。
      elsif (player_hand == 0 && enemy_hand == 1) || (player_hand == 1 && enemy_hand == 2) || (player_hand == 2 && enemy_hand == 0)
        puts "あなたの勝ちです!"
        return false
      else
        puts "あなたの負けです!"
        return false
      end
    end
  end
end
# じゃんけんゲームを実行するロジックを書きます。
class GameStart
  # selfを使用することで、GameStartをインスタンス化することなく、クラス名を使ってjankenponメソッドを呼び出せます。
  def self.jankenpon
    player = Player.new
    enemy = Enemy.new
    janken = Janken.new
    # 「next_game」が「false」だと繰り返し処理を終了し、「true」だと繰り返し処理を継続します。
    next_game = true
    while next_game == true do
      next_game = janken.pon(player.hand, enemy.hand)
    end
  end
end
GameStart.jankenpon
