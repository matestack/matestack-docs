require 'rest-client'

class Components::Md < Matestack::Ui::StaticComponent

  def response
    components {
      div class: "markdown-content", attributes: { "v-pre": true } do
        plain parsed_markdown
      end
    }
  end

  def parsed_markdown
    if @options[:remote] == true
      @md = ::Rails.cache.fetch("components_md_remote_#{options[:path]}", expires_in: 1.minute) do
        RestClient.get(@options[:path]).body
      end
    else
      @md = File.read("#{::Rails.root}/app/#{@options[:path]}.md")
    end

    begin
      if options[:lang].present?
        @md.prepend("```#{options[:lang]} \n")
        @md.concat("\n ```")
      end
    rescue => e
      raise e
    end

    renderer = RougeRender.new(with_toc_data: true)
    parser = Redcarpet::Markdown.new(renderer, fenced_code_blocks: true)
    parser.render(@md)
  end

end
