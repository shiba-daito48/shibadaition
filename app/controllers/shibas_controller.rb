class ShibasController < ApplicationController
  before_action :authenticate_user!,only:[:new,:create,:edit]

    def index
      if params[:search] == nil
        @shibas= Shiba.all
      elsif params[:search] == ''
        @shibas= Shiba.all
      else
        @shibas = Shiba.where("name LIKE ? ",'%' + params[:search] + '%')
        @shibas = Shiba.where("about LIKE ? ",'%' + params[:search] + '%')
        @shibas = Shiba.where("genre LIKE ? ",'%' + params[:search] + '%')
        @shibas = Shiba.where("image LIKE ? ",'%' + params[:search] + '%')
      end
    end
    
      def new
        @shiba = Shiba.new
      end

      def shibadai
      end
    
      def create
        shiba = Shiba.new(shiba_params)

        shiba.user_id = current_user.id

        if shiba.save!
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
      end
    
      def show
        @shiba = Shiba.find(params[:id])
        @comments = @shiba.comments
        @comment = Comment.new
      end

      def edit
        @shiba = Shiba.find(params[:id])
      end

      def update
        shiba = Shiba.find(params[:id])
        if shiba.update(shiba_params)
          redirect_to :action => "show", :id => shiba.id
        else
          redirect_to :action => "new"
        end
      end

      def destroy
        shiba = Shiba.find(params[:id])
        shiba.destroy
        redirect_to action: :index
      end

      private
      def shiba_params
        params.require(:shiba).permit(:name, :genre, :image, :about)
      end
end
