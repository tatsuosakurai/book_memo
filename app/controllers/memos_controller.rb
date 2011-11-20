# -*- coding: utf-8 -*-
class MemosController < ApplicationController
  def new
    @book = Book.find(params[:book_id])
    @memo = @book.memos.new
  end
end