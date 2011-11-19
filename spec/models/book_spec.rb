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
end
