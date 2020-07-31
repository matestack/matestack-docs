class Docs::Pages::Home < Matestack::Ui::Page

  def response
    partial :hero
    partial :content
  end

  def hero
    section id: 'hero' do
      div class: 'container' do
        div class: 'row py-3' do
          div class: 'col-md-4 offset-md-3 col-12' do
            heading size: 2, class: 'my-3 pr-3', text: 'Matestack::Ui::Core'
            heading size: 3, class: 'my-3', text: 'The Rails View layer, reimagined.'
          end
        end
      end
    end
  end

  def content
    section id: 'content' do
      div class: 'container' do
        div class: 'row py-4' do
          div class: 'col-lg-8 col-md-7 offset-md-3 col-12' do
            plain 'Bonjour'
            # TODO: add content to start page

            # Welcome!

            # 1 Guides --> what are guides?
            # link to installation guide as getting started

            # 2 API --> what are API?
            # link to technical deep dive
            # link to components overview

            # 3 Specs --> what are specs?
            # link to spec overview
          end
        end
      end
    end
  end

end
