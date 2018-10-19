module Pages
  module Guides
    class Concepts < Page::Cell::Page

      def prepare
        @title = "Concepts"
        @sub_title = "Learn the basics about basemate's architecture"
      end

      def response
        components {
          page_header title: @title, sub_title: @sub_title
          row do
            col desktop: 8, offset: { desktop: 2 } do
              div class: "page-content" do
                row do
                  col do
                    md path: "markdown/guides/basic_concepts/building_blocks_1"
                #   end
                # end
                # # row do
                # #   col do
                # #     img path: "guides/basic_concepts/building_blocks.png"
                # #   end
                # # end
                # row do
                #   col do
                    md path: "markdown/guides/basic_concepts/building_blocks_2"
                  end
                end
                row do
                  col do
                    md path: "markdown/guides/basic_concepts/core_components"
                  end
                end
                row do
                  col do
                    md path: "markdown/guides/basic_concepts/custom_components"
                  end
                end
                row do
                  col do
                    md path: "markdown/guides/basic_concepts/plugin_components"
                  end
                end
                row do
                  col do
                    md path: "markdown/guides/basic_concepts/static_vs_dynamic_components"
                  end
                end
                row do
                  col do
                    md path: "markdown/guides/basic_concepts/rails_integration_1"
                  end
                end
                row do
                  col do
                    img path: "guides/basic_concepts/request_processing.png"
                  end
                end
                row do
                  col do
                    md path: "markdown/guides/basic_concepts/rails_integration_2"
                  end
                end
                row do
                  col do
                    md path: "markdown/guides/basic_concepts/vuejs_integration_1"
                  end
                end
                row do
                  col do
                    img path: "guides/basic_concepts/vuejs_integration.png"
                  end
                end
              end
            end
          end
        }
      end

    end
  end
end
