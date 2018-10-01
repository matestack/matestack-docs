module Website
  class Home < Page::Cell::Page

    def prepare
      @welcome_text = <<-eos
        Dolore ex deserunt aute fugiat aute nulla ea sunt aliqua nisi cupidatat eu.
        Nostrud in laboris labore nisi amet do dolor eu fugiat consectetur elit cillum esse.
        Pariatur occaecat nisi laboris tempor laboris eiusmod qui id Lorem esse commodo in.
        Exercitation aute dolore deserunt culpa consequat elit labore incididunt elit anim.
      eos
    end

    def response
      components {
        partial :card, "Welcome to this Dummy Application", @welcome_text
      }
    end

    def card title, content
      partial {
        div class: "mdl-card mdl-cell mdl-cell--12-col mdl-shadow--2dp" do
          div class: "mdl-card__supporting-text" do
            heading size: 4, text: title
            plain content
          end
        end
      }
    end


  end
end
