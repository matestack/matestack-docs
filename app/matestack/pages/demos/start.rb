module Pages
  module Demos
    class Start < Matestack::Ui::Page


      def response
        components {
          div class: "page-heading" do
           custom_row do
              custom_col desktop: 8, offset: { desktop: 2} do
                div class: "page-content" do
                  heading size: 2, text: "Demos"
                  heading size: 5, text: "Watch basemate in action"
                end
              end
            end
          end
         custom_row do
            custom_col desktop: 8, offset: { desktop: 2} do
             custom_md path: "markdown/demos/start"
            end
          end
        }
      end

    end
  end
end
