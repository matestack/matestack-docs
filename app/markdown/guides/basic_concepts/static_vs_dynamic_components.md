## Static vs. Dynamic Components

Static components are rendered to HTML on the serverside and transferred to the browser.
They simple can't perform any clientside action. "div" and "span" are static core
components for example.
Dynamic components are also rendered to HTML on the serverside and transferred
to the browser. In contrast to static components, they are wrapped in a special
HTML tag and shipped with a Vue.js component JS. Thanks to Vue.js they can perform
all kinds of clientside actions such as rerendering themselves on a specific
user interaction.
You can implement static or dynamic custom components. Keep in mind, that implementing
dynamic components requires webpacker.
