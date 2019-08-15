module Pages
  module Guides
    class Motivation < Matestack::Ui::Page

      def prepare

      end

      def response
        components {
          div class: "page-heading" do
           custom_row do
              custom_col desktop: 6, offset: { desktop: 2 } do
                div class: "page-content" do
                  heading size: 2, text: "Why basemate?"
                  heading size: 5, text: "Escape the frontend hustle. Create beautiful software easily. Use basemate."
                end
              end
            end
          end
         custom_row do
            custom_col desktop: 6, offset: { desktop: 2 } do
              div class: "page-content" do
               custom_md path: "markdown/guides/motivation"
              end
            end
          end
        }
      end

    end
  end
end
