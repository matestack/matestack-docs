class Pages::Guides::GithubDoc < Pages::Base::GithubDoc

  def prepare
    super
    @github_api_md_path = "https://raw.githubusercontent.com/basemate/matestack-ui-core/#{@branch}/guides/#{@file}"
    @sub_title = "Guide"
  end

end
