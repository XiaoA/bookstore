class AuthorsController < ApplicationController

  def index
    @authors = Author.all
  end

  def show
    @author = Author.find(params[:id])
  end

  def new
    @author = Author.create(params[:id])
  end

  def create
    @author = Author.new(author_params)
    if @author.save
      flash[:success] = "Author has been created."
      redirect_to @author
    else
      flash[:danger] = "Author has not been created."
      render :new
    end
  end

  def edit
    @author = Author.find(params[:id])
    render :edit
  end

  def update
    @author = Author.find(params[:id])
    if @author.update(author_params)
      flash[:success] = "Author has been updated."
      redirect_to @author
    else
      flash[:danger] = "Author has not been updated."
      render :edit
    end
  end

  def destroy
    @author = Author.find(params[:id])
    if @author.destroy
      flash[:success] = "Author has been deleted."
      redirect_to authors_path
    else
      render :show
    end
  end

  private

  def author_params
    params.require(:author).permit(:first_name, :last_name)
  end
end
