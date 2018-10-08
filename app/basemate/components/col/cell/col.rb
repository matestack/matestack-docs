module Components
  module Col::Cell
    class Col < Component::Cell::Static

      def col_classes
        classes = []

        classes << "col"
        classes << "mdl-cell--#{options[:desktop]}-col-desktop" unless options[:desktop].nil?
        classes << "mdl-cell--#{options[:tablet]}-col-tablet" unless options[:tablet].nil?
        classes << "mdl-cell--#{options[:phone]}-col-phone" unless options[:phone].nil?

        unless options[:offset].nil?
            classes << "mdl-cell--#{options[:offset][:desktop]}-offset-desktop" unless options[:offset][:desktop].nil?
            classes << "mdl-cell--#{options[:offset][:tablet]}-offset-tablet" unless options[:offset][:tablet].nil?
            classes << "mdl-cell--#{options[:offset][:phone]}-offset-phone" unless options[:offset][:phone].nil?
        end

        return classes.join(" ")
      end

    end
  end
end
