# encoding: utf-8

step 'hotpansサイトにアクセスする' do
  Capybara.app_host = "http://hotpans.herokuapp.com/"
end

step 'トップページを表示する' do
  visit '/'
end

step '画面にようこそと表示されていること' do
  expect(page).to have_content('HotPans')
  expect(page).to have_content('Facebookでログイン')
end

step 'Facebookログインページを表示する' do
  visit '/auth/facebook/'
end

step 'id と password を入力する' do
  fill_in 'email', :with => 'okadaken@gmail.com'
  fill_in 'pass', :with => 'ukvgep37alckBnt9ovo1'
end

step 'サインインボタンをクリックする' do
  click_button 'login'
end

step 'ログイン後の設定を入力する' do
  fill_in 'name_action_selected', :with => 'dont_save'
end

step 'サインインボタンをクリックする２' do
  click_button "submit[Continue]"
end

step 'ログインに成功したこと' do
  expect(page).to have_content('ログインしました')
end

