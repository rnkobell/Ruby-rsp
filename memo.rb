require "csv"

puts "1 → 新規でメモを作成する / 2 → 既存のメモを編集する"

# 入力が1か2になるまでループ

memo_type = nil
loop do
  memo_type = gets.to_i
  if memo_type == 1 or memo_type == 2
    break
  else
    puts "1か2を入力してください。"
  end
end

if memo_type == 1
  puts "拡張子を除いたファイル名を入力してください"
  file_name = gets.chomp + ".csv"

  puts "メモしたい内容を記入してください（終了するには Ctrl+D (Mac,Linux)/ Ctrl+Z (Windows)）"
  memo_content = STDIN.read

  CSV.open(file_name, "w") do |csv|
    csv << [memo_content]
  end
  puts "#{File.expand_path(file_name)} を作成しました。"

elsif memo_type == 2
  # 既存編集
  puts "拡張子を除いた編集したいファイル名を入力してください"
  file_name = gets.chomp + ".csv"

  if File.exist?(file_name)
    puts "追記したい内容を記入してください（終了するには Ctrl+D / Ctrl+Z + Enter）"
    memo_content = STDIN.read

    CSV.open(file_name, "a") do |csv|
      csv << [memo_content]
    end
    puts "#{File.expand_path(file_name)} に追記しました。"
  else
    puts "指定したファイルは存在しません。"
  end
end
