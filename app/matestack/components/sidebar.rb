class Components::Sidebar < Matestack::Ui::StaticComponent

  def prepare
    @file_doc_links = []
    @tree = nil

    @branch = '20200914_improve-and-extend-documentation'
    # TODO: line below references master branch, so links below need update down the row
    @github_base_api_url = "https://#{ENV['GITHUB_USERNAME']}:#{ENV['GITHUB_PERSONAL_ACCESS_TOKEN']}@api.github.com/repos/basemate/matestack-ui-core/contents"
    @current_page = @options[:currentPage]
    @current_path = @current_page.gsub('.md', '').gsub('.rb', '')

    # TODO: Refactor below to work fine with new doc/api/guides structure! (esp. add /docs/ prefix to @github_component_docs_path)
    case @current_path
    when base_api_path
      @github_component_docs_path = "#{@github_base_api_url}/docs/api/000-base?ref=#{@branch}"
      @tree = ::Rails.cache.fetch("base_remote_#{options[:path]}", expires_in: 1.minute) do
        JSON.parse(RestClient.get(@github_component_docs_path).body)
      end
      if @tree
        @tree.each do |item|
          if item["type"] == "file"
            @file_doc_links << item
          end
        end
      end
      @file_doc_links.sort_by! { |item| item['name'].scan(/\d+/).first.to_i }
    when components_api_path
      @github_component_docs_path = "#{@github_base_api_url}/docs/api/100-components?ref=#{@branch}"
      @tree = ::Rails.cache.fetch("components_remote_#{options[:path]}", expires_in: 1.minute) do
        JSON.parse(RestClient.get(@github_component_docs_path).body)
      end
      if @tree
        @tree.each do |item|
          if item["type"] == "file"
            @file_doc_links << item
          end
        end
      end
      @file_doc_links.sort_by! { |item| item['name'].scan(/\d+/).first.to_i }
    when guides_path
      @github_component_docs_path = "#{@github_base_api_url}/docs/guides?ref=#{@branch}"
      @tree = ::Rails.cache.fetch("guides_remote_#{options[:path]}", expires_in: 1.minute) do
        JSON.parse(RestClient.get(@github_component_docs_path).body)
      end
      if @tree
        @tree.each do |item|
          if item["type"] == "dir"
            @file_doc_links << item
          end
        end
      end
      @file_doc_links.sort_by! { |item| item['name'].scan(/\d+/).first.to_i }
    end

  end

  def response
    div id: 'custom-sidebar', class: 'container-fluid' do
      nav id: 'wrapper', class: 'bg-dark sidebar' do
        div class: 'sidebar-sticky menu' do
          ul id: 'listGroup', class: 'list-group list-group-flush' do
            case @current_path
            when base_api_path
              partial :side_title, 'base api'
              @file_doc_links.each do |item|
                partial :transition_link, :base_api_path, { key: item['name'],  }, item['name'].gsub(".md", "")
              end
            when components_api_path
              partial :side_title, 'components api'
              @file_doc_links.each do |item|
                partial :transition_link, :components_api_path, { key: item['name'],  }, item['name'].gsub(".md", "")
              end
            when guides_path
              partial :side_title, 'guides'
              @file_doc_links.each do |item|
                partial :transition_link, :guides_path, { key: "#{item['name']}/README.md"  }, item['name'].split("-").last.humanize.camelcase
              end
            end
          end
        end
      end
    end
  end

  private

  def side_title text
    heading size: 5, class: 'list-group-item-heading text-white ml-2 pl-3 my-3 pt-4 pb-3', text: text.upcase
  end

  def transition_link path, params, text
    button class: "links-btn" do
      transition path: path, params: params, text: text.camelcase, class: "list-group-item list-group-item-action"
    end
  end

end
