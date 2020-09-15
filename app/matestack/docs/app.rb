class Docs::App < Matestack::Ui::App

  def response
    docs_header
    main class: 'pt-5' do
      docs_sidebar currentPage: context[:request].path
      yield_page slots: { loading_state: loading_state_element }
    end
    # docs_footer
  end

  def loading_state_element
    slot do
      div class: 'bouncing-loader'
    end
  end

end
