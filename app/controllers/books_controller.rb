# -*- coding: utf-8 -*-
class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def create
    flash[:notice] = "登録しました。"
    @book = Book.new(params[:book])
    @book.save
    redirect_to @book
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
    flash[:notice] = "更新しました。"
    @book = Book.find(params[:id])
    @book.update_attributes(params[:book])
    redirect_to @book
  end

end
