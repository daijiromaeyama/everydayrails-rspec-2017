require 'rails_helper'

RSpec.describe Note, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:project) { FactoryBot.create(:project, owner: user) }

  it { is_expected.to have_attached_file(:attachment) }

  # ユーザー、プロジェクト、メッセージがあれば有効な状態であること
  it "is valid with a user, project, and message" do
    note = Note.new(
      message: "This is a sample note.",
      user: user,
      project: project,
    )
    expect(note).to be_valid
  end

  # 文字列に一致するメッセージを検索する
  describe "search message for a term" do
    let!(:note1) {
      FactoryBot.create(:note,
        project: project,
        user: user,
        message: "This is the first note."
      )
    }

    let!(:note2) {
      FactoryBot.create(:note,
        project: project,
        user: user,
        message: "This is the second note.",
      )
    }

    let!(:note3) {
      FactoryBot.create(:note,
        project: project,
        user: user,
        message: "First, preheat the oven."
      )
    }

    # 一致するデータが見つかるとき
    context "when a match is found" do
      # 検索文字列に一致するメモを返すこと
      it "returns notes that match the search term" do
        expect(Note.search("first")).to include(note1, note3)
      end
    end

    # 一致するデータが1件も見つからないとき
    context "when no match is found" do
      # 空のコレクションを返すこと
      it "returns an empty collection" do
        expect(Note.search("message")).to be_empty
        expect(Note.count).to eq 3
      end
    end

    # 名前の取得をメモを作成したユーザーに移譲すること
    it "delegates name to the user who created it" do
      user = instance_double("User", name: "Fake User")
      note = Note.new
      allow(note).to receive(:user).and_return(user)
      expect(note.user_name).to eq "Fake User"
    end
  end
end
