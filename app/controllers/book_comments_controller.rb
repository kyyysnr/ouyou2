class BookCommentsController < ApplicationController

  def create
    @book = Book.find(params[:book_id])
    @book_comment = @book.book_comments.new(book_comment_params)
    @book_comment.user_id = current_user.id
    @book.save
    redirect_back(fallback_location: root_path)

  end


  def destroy
    BookComment.find(params[:book_id]).destroy
    redirect_back(fallback_location: root_path)

  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:text)
  end

end
