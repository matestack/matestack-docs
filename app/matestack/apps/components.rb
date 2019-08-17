require 'rest-client'

module Apps
  class Components < Apps::BaseDoc

    def prepare
      super

      @github_component_docs_path = "https://api.github.com/repos/basemate/matestack-ui-core/contents/docs/components"
      @component_doc_links = []
      @tree = JSON.parse(RestClient.get(@github_component_docs_path).body)
      @tree.each do |item|
        if item["type"] == "file"
          @component_doc_links << item
        end
      end

    end

    def side_navigation_content
      partial {
        span class: "navigation-header" do
          plain "Components"
        end
        @component_doc_links.each do |item|
          partial :transition_link, :components_path, { key: "#{item['name']}" }, item['name'].gsub(".md", "").camelcase
        end
      }
    end

  end
end
