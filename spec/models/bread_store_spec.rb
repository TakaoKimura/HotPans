require 'spec_helper'

describe BreadStore do

  fixtures :BreadStore #テストデータを設定
  I18n.enforce_available_locales = false

  before(:each) do #全テスト実行前の共通動作
    @BreadStore = BreadStore(:valid) #BreadStore.ymlの (valid:)で指定されているデータを設定
  end

  it "とりあえずモデルが作れるかテスト" do
    @BreadStore.should be_valid
  end

  it "addressが空の時:エラーが発生すること" do
    @BreadStore.address = ""
    @BreadStore.should_not be_valid #be_validで無いことを確認する
  end

  it "名前が短すぎるとエラーになるかチェック" do
    @BreadStore.name = "a"
    @BreadStore.should_not be_valid #be_validで無いことを確認する
    @BreadStore.name = "あ"
    @BreadStore.should_not be_valid #be_validで無いことを確認する
  end

  it "名前２文字のチェック" do
    @BreadStore.name = "aa"
    @BreadStore.should be_valid #be_validで無いことを確認する
    @BreadStore.name = "ああ"
    @BreadStore.should be_valid #be_validで無いことを確認する
  end

  #pending "add some examples to (or delete) #{__FILE__}"
end
