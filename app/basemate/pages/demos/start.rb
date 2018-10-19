module Pages
  module Demos
    class Start < Page::Cell::Page


      def response
        components {
          div class: "page-heading" do
            row do
              col desktop: 8, offset: { desktop: 2} do
                div class: "page-content" do
                  heading size: 2, text: "Demos"
                  heading size: 5, text: "Watch basemate in action"
                end
              end
            end
          end
          row do
            col desktop: 8, offset: { desktop: 2} do
              md path: "markdown/demos/start"
            end
          end
        }
      end

    end
  end
end
