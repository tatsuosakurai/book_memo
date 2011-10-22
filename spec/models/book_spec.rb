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
    end
  end
end
