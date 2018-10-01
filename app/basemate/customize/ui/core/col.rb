module Customize::Ui::Core
  class Col

    def col_classes(classes, options)
      classes << "mdl-cell--#{options[:desktop]}-col-desktop" unless options[:desktop].nil?
      classes << "mdl-cell--#{options[:tablet]}-col-tablet" unless options[:tablet].nil?
      classes << "mdl-cell--#{options[:phone]}-col-phone" unless options[:phone].nil?

      classes << "top-buffer" if options[:top_buffer] == true

      unless options[:offset].nil?
          classes << "mdl-cell--#{options[:offset][:desktop]}-offset-desktop" unless options[:offset][:desktop].nil?
          classes << "mdl-cell--#{options[:offset][:tablet]}-offset-tablet" unless options[:offset][:tablet].nil?
          classes << "mdl-cell--#{options[:offset][:phone]}-offset-phone" unless options[:offset][:phone].nil?
      end

      return classes
    end

  end
end
