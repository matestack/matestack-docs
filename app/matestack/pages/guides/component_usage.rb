module Pages
  module Guides
    class ComponentUsage < Matestack::Ui::Page

      def prepare
      end

      def response
        components {
          div class: "page-heading" do
           custom_row do
              custom_col desktop: 6, offset: { desktop: 2 } do
                div class: "page-content" do
                  heading size: 2, text: "How to use a basemate Component"
                  # heading size: 5, text: "Welcome to our documentation"
                end
              end
            end
          end
         custom_row do
            custom_col desktop: 6, offset: { desktop: 2 } do
              div class: "page-content" do
               custom_md path: "markdown/guides/component_usage"
              end
            end
          end
        }
      end

    end
  end
end
