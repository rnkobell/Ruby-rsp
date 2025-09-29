#じゃんけん

puts "じゃんけんをします。"

def janken
    puts "0(グー) 1(チョキ) 2(パー)"

hand = nil
loop do
    hand = gets.to_i
    if hand == 0 or hand == 1 or hand == 2
        break
    else
        puts "0(グー) 1(チョキ) 2(パー)を入力してください。"
    end
end


com_hand = rand(3)
rsp = ["グー","チョキ","パー"]

puts "あなたの手：#{rsp[hand]}
     COMの手：#{rsp[com_hand]}"

if hand == com_hand
    puts "プレイヤーとCOMはあいこです。再度じゃんけんをします。"
    result = "draw"
elsif (hand == 0 and com_hand == 1) or (hand == 1 and com_hand == 2) or (hand == 2 and com_hand == 0)
    puts "プレイヤーの勝利です。あっち向いてホイを始めます。"
    result = "win"
else
    puts "プレイヤーの敗北です。あっち向いてホイを始めます。"
    result = "lose"
end

return result
end

#あっちむいてホイ

def hoi(attacker)
    puts "0(上) 1(右) 2(下) 3(左)を選んでください。"
head = nil

loop do
    head = gets.to_i
    if head == 0 or head == 1 or head == 2 or head == 3
        break
    else
        puts "0(上) 1(右) 2(下) 3(左)を選んでください。"
    end
end


com_head = rand(4)
heads = ["上","右","下","左"]

puts "あなた：#{heads[head]}
     COM：#{heads[com_head]}"

if head == com_head
    if attacker == "player"
        puts "勝利"
    else
        puts "敗北"
        return "end"
    end
else
    puts "引き分け！ジャンケンからやり直します！"
    return "retry"
end
end

loop do
    result = janken

    if result == "draw"
        next
    elsif result == "win"
        hoi_result = hoi("player")
        break if hoi_result == "end"
    elsif result == "lose"
        hoi_result = hoi("com")
        break if hoi_result == "end"
    end
end

puts "ゲーム終了"