module Apps
  class Docs < Apps::BaseDoc

    def prepare
      super
      @menu_links = ["install", "concepts", "components", "integrations", "tooling", "extend", "architecture", "contribute"]
    end

    def side_navigation_content
      partial {
        span class: "navigation-header" do
          plain "Documentation"
        end
        @menu_links.each do |item|
          partial :transition_link, :docs_path, { key: item }, item.camelcase
        end
      }
    end

  end
end
