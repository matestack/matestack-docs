module Pages
  module Guides
    class Installation < Matestack::Ui::Page

      def prepare

      end

      def response
        components {
          div class: "page-heading" do
           custom_row do
              custom_col desktop: 8, offset: { desktop: 2 } do
                div class: "page-content" do
                  heading size: 2, text: "Installation"
                  heading size: 5, text: "Classic Rails Assets Pipeline Setup"
                end
              end
            end
          end
         custom_row do
            custom_col desktop: 8, offset: { desktop: 2 } do
              div class: "page-content" do
               custom_md path: "markdown/guides/installation"
              end
            end
          end
        }
      end

    end
  end
end
