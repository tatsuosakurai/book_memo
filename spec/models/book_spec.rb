# coding:utf-8
require 'spec_helper'

describe Book do
  describe "バリデーション" do
    describe "title" do
      context "が無い時" do
        subject { Book.new.valid? }
        it { should be_false }
      end

      context "が入力されている時" do
        subject { Book.new(:title => "ハリーポッター").valid? }
        it { should be_true }
      end

      context "256文字以下はOK" do
        title = "a" * 256
        subject { Book.new(:title => title).valid? }
        it { should be_true }
      end

      context "256文字以上はNG" do
        title = "a" * (256 + 1)
        subject { Book.new(:title => title).valid? }
        it { should be_false }
      end
    end
  end

  describe ".last_month" do
    let(:this_month_book) { Book.create!(:title => "今月の本", :updated_at => Time.now) }
    let(:last_month_book) { Book.create!(:title => "前月の本", :updated_at => Time.now - 1.month) }
    subject { Book.this_month }

    it "今月の本が含まれていること" do
      should include(this_month_book)
    end
    it "前月の本が含まれていないこと" do
      should_not include(last_month_book)
    end
  end
end
