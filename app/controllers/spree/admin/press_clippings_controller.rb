module Spree
  module Admin
    class PressClippingsController < ResourceController

      def index
        @press_clippings = Spree::PressClipping.order(:published_at)
      end

      def images
        @press_clipping = Spree::PressClipping.includes(:images).find(params[:id])
      end

      def new_image
      end

      def create_image
        @press_clipping = Spree::PressClipping.find(params[:id])
        @image = Spree::Image.new(viewable_id: @press_clipping.id, viewable_type: "Spree::PressClipping")
        if @image.update_attributes!(image_params)
          return redirect_to images_admin_press_clipping_path(@press_clipping)
        else
          return redirect_to new_image_admin_press_clipping_path(@press_clipping)
        end
      end

      def edit_image
        @press_clipping = Spree::PressClipping.find(params[:id])
        @image = Spree::Image.find(params[:image_id])
      end

      def update_image
        @press_clipping = Spree::PressClipping.find(params[:id])
        @image = Spree::Image.find(params[:image_id])
        if @image.update_attributes!(image_params)
          return redirect_to images_admin_press_clipping_path(@press_clipping)
        else
          return redirect_to update_image_admin_press_clipping_path(@press_clipping, image_id: @image)
        end
      end

      def delete_image
        @press_clipping = Spree::PressClipping.find(params[:id])
        @image = Spree::Image.find(params[:image_id])
        @image.destroy
        render nothing: true
      end

      def update_positions
        ActiveRecord::Base.transaction do
          params[:positions].each do |id, index|
            Spree::Image.find(id).set_list_position(index)
          end
        end

        respond_to do |format|
          format.js { render text: 'Ok' }
        end
      end

      private

      def location_after_save
        url_for([:edit, :admin, @press_clipping])
      end

      def image_params
        params.require(:post).permit(:attachment, :alt)
      end

    end
  end
end
