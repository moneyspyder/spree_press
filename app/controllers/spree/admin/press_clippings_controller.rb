module Spree
  module Admin
    class PressClippingsController < ResourceController

      def index
        @press_clippings = Spree::PressClipping.order(:published_at)
      end

      private

      def location_after_save
        url_for([:edit, :admin, @press_clipping])
      end

    end
  end
end
