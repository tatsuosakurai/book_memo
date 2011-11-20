# -*- coding: utf-8 -*-
class MemosController < ApplicationController
  before_filter :find_book

  def new
    @memo = @book.memos.new
  end

  def create
    @memo = @book.memos.new(params[:memo])
    if @memo.save
      redirect_to book_path(@book), :notice => "メモを登録しました。"
    else
      render :new
    end
  end

  def edit
    @memo = @book.memos.find(params[:id])
  end

  def update
    @memo = @book.memos.find(params[:id])
    if @memo.update_attributes(params[:memo])
      redirect_to book_path(@book), :notice => "メモを更新しました。"
    else
      render :action => "edit"
    end
  end

  def destroy
    @memo = @book.memos.find(params[:id])
    @memo.destroy
    redirect_to book_path(@book)
  end

  private
  def find_book
    @book = Book.find(params[:book_id])
  end
end