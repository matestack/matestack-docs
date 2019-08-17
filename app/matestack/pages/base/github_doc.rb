class Pages::Base::GithubDoc < Matestack::Ui::Page

  def prepare
    @branch = "master"
    case context[:params][:format]
    when "md"
      @file = context[:params][:key] + ".md"
    when "rb"
      @file = context[:params][:key] + ".rb"
      @md_language_wrapper = "ruby"
    else
      @file = context[:params][:key] + "/README.md"
    end
    @github_api_md_path = nil #to be defined in subclass
    @sub_title = nil #to be defined in subclass
  end

  def response
    components {
     custom_page_header title: @file.gsub(".md", "").gsub(".rb", "").gsub("/README", "").camelcase, sub_title: @sub_title
     custom_row do
        custom_col desktop: 8, offset: { desktop: 2 } do
          div class: "page-content" do
           custom_row do
              custom_col do
                custom_md path: @github_api_md_path, remote: true, lang: @md_language_wrapper
              end
            end
          end
        end
      end
    }
  end

end
