crumb :root do
  link "Fmarket", root_path
end

crumb :mypage do
  link "マイページ", mypage_path
end

crumb :identification do
  link "本人情報の登録", identification_mypage_path
  parent :mypage
end

crumb :profile do
  link "プロフィール", profile_mypage_path
  parent :mypage
end

crumb :card do
  link "支払い方法", card_mypage_path
  parent :mypage
end

crumb :logout do
  link "ログアウト", logout_mypage_path
  parent :mypage
end

