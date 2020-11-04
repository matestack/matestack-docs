class Components::Sidebar < Matestack::Ui::StaticComponent

  def generate_nav_data path, type="dir"
    @tree = ::Rails.cache.fetch("base_remote_#{path}", expires_in: 5.minutes) do
      JSON.parse(RestClient.get(@github_component_docs_path).body)
    end
    if @tree
      @tree.each do |item|
        if item["type"] == type
          @file_doc_links << item
        end
      end
    end
    @file_doc_links.sort_by! { |item| item['name'].scan(/\d+/).first.to_i }
  end

  def prepare
    @file_doc_links = []
    @tree = nil

    @branch = 'master'
    # TODO: line below references master branch, so links below need update down the row
    @github_base_api_url = "https://#{ENV['GITHUB_USERNAME']}:#{ENV['GITHUB_PERSONAL_ACCESS_TOKEN']}@api.github.com/repos/basemate/matestack-ui-core/contents"
    @current_page = @options[:currentPage]
    @current_path = @current_page.gsub('.md', '').gsub('.rb', '')

    # TODO: Refactor below to work fine with new doc/api/guides structure! (esp. add /docs/ prefix to @github_component_docs_path)
    case @current_path
    when core_start_path
      @github_component_docs_path = "#{@github_base_api_url}/docs/start?ref=#{@branch}"
      generate_nav_data(@current_path)
    when core_ui_components_path
      @github_component_docs_path = "#{@github_base_api_url}/docs/ui_components?ref=#{@branch}"
      generate_nav_data(@current_path)
    when core_reactive_components_path
      @github_component_docs_path = "#{@github_base_api_url}/docs/reactive_components?ref=#{@branch}"
      generate_nav_data(@current_path)
    when core_reactive_apps_path
      @github_component_docs_path = "#{@github_base_api_url}/docs/reactive_apps?ref=#{@branch}"
      generate_nav_data(@current_path)
    when core_api_path
      @github_component_docs_path = "#{@github_base_api_url}/docs/api/100-components?ref=#{@branch}"
      generate_nav_data(@current_path, "file")
    end
  end

  def response
    div id: 'custom-sidebar', class: 'container-fluid' do
      nav id: 'wrapper', class: 'bg-dark sidebar' do
        div class: 'sidebar-sticky menu' do
          ul id: 'listGroup', class: 'list-group list-group-flush' do
            case @current_path
            when core_start_path
              side_title 'start'
              @file_doc_links.each do |item|
                transition_link :core_start_path, { key: "#{item['name']}"  }, item['name'].split("-").last.humanize.camelcase.gsub(".md", "") unless item['name'] == 'README.md'
              end
            when core_ui_components_path
              side_title 'UI components'
              @file_doc_links.each do |item|
                transition_link :core_ui_components_path, { key: "#{item['name']}"  }, item['name'].split("-").last.humanize.camelcase.gsub(".md", "") unless item['name'] == 'README.md'
              end
            when core_reactive_components_path
              side_title 'Reactive components'
              @file_doc_links.each do |item|
                transition_link :core_reactive_components_path, { key: "#{item['name']}"  }, item['name'].split("-").last.humanize.camelcase.gsub(".md", "") unless item['name'] == 'README.md'
              end
            when core_reactive_apps_path
              side_title 'Reactive apps'
              @file_doc_links.each do |item|
                transition_link :core_reactive_apps_path, { key: "#{item['name']}"  }, item['name'].split("-").last.humanize.camelcase.gsub(".md", "") unless item['name'] == 'README.md'
              end
            when core_api_path
              side_title 'Components API'
              @file_doc_links.each do |item|
                transition_link :core_api_path, { key: item['name'],  }, item['name'].gsub(".md", "") unless item['name'] == 'README.md'
              end
            end
          end
        end
      end
    end
  end

  private

  def side_title text
    link path: "https://github.com/matestack/matestack-ui-core", target: "_blank", class: "pt-4 text-decoration-none" do
      small class: 'list-group-item-heading text-white ml-2 pl-3 my-3 pt-4 text-monospace font-weight-light', text: "matestack-ui-core v1.1.0"
    end
    heading size: 5, class: 'list-group-item-heading text-white ml-2 pl-3 my-3 pt-4 pb-3', text: text.upcase
  end

  def transition_link path, params, text
    button class: "links-btn" do
      transition path: path, params: params, text: text.camelcase, class: "list-group-item list-group-item-action"
    end
  end

end
