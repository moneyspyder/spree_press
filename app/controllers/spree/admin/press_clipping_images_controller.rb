module Spree
  module Admin
    class PressClippingImagesController < ResourceController
      before_action :load_edit_data, except: :index
      before_action :load_index_data, only: :index

      create.before :set_viewable
      update.before :set_viewable

      private

      def location_after_destroy
        admin_press_clipping_images_url(@press_clipping)
      end

      def location_after_save
        admin_press_clipping_images_url(@press_clipping)
      end

      def load_index_data
        @press_clipping = PressClipping.friendly.includes(*variant_index_includes).find(params[:press_clipping_id])
      end

      def load_edit_data
        # @press_clipping = Product.friendly.includes(*variant_edit_includes).find(params[:product_id])
        # @variants = @press_clipping.variants.map do |variant|
        #   [variant.sku_and_options_text, variant.id]
        # end
        # @variants.insert(0, [Spree.t(:all), @press_clipping.master.id])
      end

      def set_viewable
        @image.viewable_type = 'Spree::PressClipping'
        @image.viewable_id = params[:image][:viewable_id]
      end

      # def variant_index_includes
      #   [
      #     variant_images: [viewable: { option_values: :option_type }]
      #   ]
      # end

      # def variant_edit_includes
      #   [
      #     variants_including_master: { option_values: :option_type, images: :viewable }
      #   ]
      # end
    end
  end
end
