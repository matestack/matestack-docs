module Components
  module Markdown::Cell
    class Markdown < Component::Cell::Static

      def parsed_markdown
        @md = File.read("#{::Rails.root}/app/#{options[:path]}.md")
        renderer = RougeRender.new(with_toc_data: true)
        parser = Redcarpet::Markdown.new(renderer, fenced_code_blocks: true)
        parser.render(@md)
      end

    end
  end
end
