# -*- coding: utf-8 -*-
class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(params[:book])
    if @book.save
      redirect_to @book, :notice => "登録しました。"
    else
      render :new
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def index
    @books = Book.order('created_at desc')
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update_attributes(params[:book])
      redirect_to @book, :notice => "更新しました。"
    else
      render :edit
    end
  end

end
