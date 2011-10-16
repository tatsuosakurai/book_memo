# coding:utf-8
require 'spec_helper'

describe Book do
  describe 'バリデーション' do
    describe 'title' do
      subject { Book.new.valid? }
      it '未入力の場合はエラー' do
        should be_false
      end
    end
  end
end
