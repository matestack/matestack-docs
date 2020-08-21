class Docs::App < Matestack::Ui::App

  def response
    docs_header
    main class: 'pt-5' do
      docs_sidebar currentPage: context[:request].path
      yield_page
    end
    # docs_footer
  end

end
