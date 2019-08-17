require 'rest-client'

module Apps
  class Guides < Apps::BaseDoc

    def prepare
      super

      @github_component_docs_path = "https://api.github.com/repos/basemate/matestack-ui-core/contents/guides"
      @component_guide_links = []
      @tree = JSON.parse(RestClient.get(@github_component_docs_path).body)
      @tree.each do |item|
        if item["type"] == "file"
          @component_guide_links << item
        end
      end

    end

    def side_navigation_content
      partial {
        span class: "navigation-header" do
          plain "Guides"
        end
        @component_guide_links.each do |item|
          partial :transition_link, :guides_path, { key: "#{item['name']}" }, item['name'].gsub(".md", "").camelcase
        end
      }
    end

  end
end
