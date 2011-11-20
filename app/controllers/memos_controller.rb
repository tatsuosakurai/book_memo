# -*- coding: utf-8 -*-
class MemosController < ApplicationController
  def new
    @book = Book.find(params[:book_id])
    @memo = @book.memos.new
  end

  def create
    @book = Book.find(params[:book_id])
    @memo = @book.memos.new(params[:memo])
    if @memo.save
      redirect_to book_path(@book), :notice => "メモを登録しました。"
    else
      render :new
    end
  end
end