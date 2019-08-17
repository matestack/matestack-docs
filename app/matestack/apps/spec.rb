require 'rest-client'

module Apps
  class Spec < Apps::BaseDoc

    def prepare
      super

      @github_component_specs_path = "https://api.github.com/repos/basemate/matestack-ui-core/contents/spec/usage/components"
      @component_specs_links = []
      @tree = JSON.parse(RestClient.get(@github_component_specs_path).body)
      @tree.each do |item|
        if item["type"] == "file"
          @component_specs_links << item
        end
      end

      @github_concept_specs_path = "https://api.github.com/repos/basemate/matestack-ui-core/contents/spec/usage/base"
      @concept_specs_links = []
      @tree = JSON.parse(RestClient.get(@github_concept_specs_path).body)
      @tree.each do |item|
        if item["type"] == "file"
          @concept_specs_links << item
        end
      end
    end

    def side_navigation_content
      partial {
        span class: "navigation-header" do
          plain "Concept Specs"
        end
        @concept_specs_links.each do |item|
          partial :transition_link, :spec_path, { key: "usage/base/#{item['name']}" }, item['name'].gsub("_spec.rb", "").camelcase
        end
        span class: "navigation-header" do
          plain "Component Specs"
        end
        @component_specs_links.each do |item|
          partial :transition_link, :spec_path, { key: "usage/components/#{item['name']}" }, item['name'].gsub("_spec.rb", "").camelcase
        end
      }
    end

  end
end
