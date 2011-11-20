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
      render :action => "new"
    end
  end

  def edit
    @book = Book.find(params[:book_id])
    @memo = @book.memos.find(params[:id])
  end

  def update
    @book = Book.find(params[:book_id])
    @memo = @book.memos.find(params[:id])
    if @memo.update_attributes(params[:memo])
      redirect_to book_path(@book), :notice => "メモを更新しました。"
    else
      render :action => "edit"
    end
  end
end