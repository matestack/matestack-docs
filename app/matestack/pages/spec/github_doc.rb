class Pages::Spec::GithubDoc < Pages::Base::GithubDoc

  def prepare
    super
    @github_api_md_path = "https://raw.githubusercontent.com/matestack/matestack-ui-core/#{@branch}/spec/#{@file}"
    @sub_title = "Specification"
  end

end
