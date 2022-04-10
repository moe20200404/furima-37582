require 'rails_helper'

RSpec.describe 'ユーザー新規登録', type: :system do
  before do
    @user = FactoryBot.build(:user)
  end
  it 'ユーザー登録できるとき	' do
    # トップページに移動する。
    basic_pass(root_path)
    visit root_path
    # トップページに「新規登録」ボタンがある事を確認する。
    expect(page).to have_content('新規登録')
    # 新規登録ページに遷移し、必要な内容を記述する。
    visit new_user_registration_path
    fill_in 'nickname', with: @user.nickname
    fill_in 'email', with: @user.email
    fill_in 'password', with: @user.password
    fill_in 'password-confirmation', with: @user.password_confirmation
    fill_in 'last-name', with: @user.last_name
    fill_in 'first-name', with: @user.first_name
    fill_in 'last-name-kana', with: @user.last_name_kana
    fill_in 'first-name-kana', with: @user.first_name_kana
    select(@user.birth_date.year.to_s, from: 'user[birth_date(1i)]')
    select(@user.birth_date.month.to_s, from: 'user[birth_date(2i)]')
    select(@user.birth_date.day.to_s, from: 'user[birth_date(3i)]')
    # 「会員登録」ボタンをクリックすると、Userモデルのカウントが1上がることをチェックする。
    expect do
      find('input[name="commit"]').click
    end.to change { User.count }.by(1)
    # トップページに遷移し、ヘッダーにnicknameが表示されることをチェックする。
    expect(current_path).to eq(root_path)
  end

  it 'ユーザー登録できないとき' do
    # トップページに移動する。
    basic_pass(root_path)
    visit root_path
    # トップページに「新規登録」ボタンがある事を確認する。
    expect(page).to have_content('新規登録')
    # 新規登録ページに遷移し、誤った内容を記述する。
    visit new_user_registration_path
    fill_in 'nickname', with: ''
    fill_in 'email', with: @user.email
    fill_in 'password', with: @user.password
    fill_in 'password-confirmation', with: @user.password_confirmation
    fill_in 'last-name', with: @user.last_name
    fill_in 'first-name', with: @user.first_name
    fill_in 'last-name-kana', with: @user.last_name_kana
    fill_in 'first-name-kana', with: @user.first_name_kana
    select(@user.birth_date.year.to_s, from: 'user[birth_date(1i)]')
    select(@user.birth_date.month.to_s, from: 'user[birth_date(2i)]')
    select(@user.birth_date.day.to_s, from: 'user[birth_date(3i)]')
    # 「会員登録」ボタンをクリックしても、Userモデルのカウントは変わらない。
    expect do
      find('input[name="commit"]').click
    end.to change { User.count }.by(0)
    # 新規登録ページのまま、エラーメッセージが表示される。
    expect(current_path).to eq(user_registration_path)
    expect(page).to have_content("Nickname can't be blank")
  end
end

RSpec.describe 'ユーザーログイン', type: :system do
  before do
    @user = FactoryBot.create(:user)
  end

  it 'ユーザーログインできるとき' do
    # 予めユーザーをDBに保存しておく。
    # トップページに移動する。
    basic_pass(root_path)
    visit root_path
    # トップページに「ログイン」ボタンがあることを確認する。
    expect(page).to have_content('ログイン')
    # ログインページにemailとpasswordを入力して、「ログイン」ボタンをクリックするとトップページに遷移する。
    sign_in(@user)
    # トップページのヘッダーにnicknameが表示されていることをチェックする。
    expect(page).to have_content(@user.nickname)
  end
  it 'ユーザーログインできないとき' do
    # 予めユーザーをDBに保存しておく。
    # トップページに遷移する。
    basic_pass(root_path)
    visit root_path
    # トップページに「ログイン」ボタンがあることを確認する。
    expect(page).to have_content('ログイン')
    # ログインページに、誤った情報を入力した状態で、「ログイン」ボタンをクリックする
    visit new_user_session_path
    fill_in 'email', with: ''
    fill_in 'password', with: @user.password
    find('input[name="commit"]').click
    expect(current_path).to eq(user_session_path)
    # ログインページのまま、エラーメッセージが表示される。
    expect(page).to have_content('Invalid Email or password')
  end
end

RSpec.describe 'ユーザーログアウト', type: :system do
  before do
    @user = FactoryBot.create(:user)
  end
  it '	予めユーザーをDBに保存しておく' do
    # 予めユーザーをDBに保存しておく。
    # トップページに遷移する。
    basic_pass(root_path)
    visit root_path
    # トップページに「ログイン」ボタンがあることを確認し、クリックする。
    expect(page).to have_content('ログイン')
    # ログインページにemailとpasswordを入力して、「ログイン」ボタンをクリックするとトップページに遷移する。
    sign_in(@user)
    # トップページのヘッダーにnicknameが表示されていることをチェックする。
    expect(page).to have_content(@user.nickname)
    expect(page).to have_no_content('ログイン')
    # トップページのヘッダーにある「ログアウト」ボタンをクリックすると、トップページが表示され、「ログイン」ボタンが表示されていることをチェックする。
    find('.logout').click
    expect(page).to have_content('ログイン')
  end
end


