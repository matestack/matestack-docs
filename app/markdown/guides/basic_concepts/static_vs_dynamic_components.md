## Static vs. Dynamic Components

Static components are rendered to HTML on the serverside and transferred to the browser.
They can not perform any clientside interaction by definition. Simple "div"s and "span"s are static core
components for example.
Dynamic components are also rendered to HTML on the serverside and transferred
to the browser. In contrast to static components, they are wrapped in a special
HTML tag and shipped with a Vue.js component JS. Thanks to Vue.js they can perform
all kinds of clientside actions such as rerendering themselves on a specific
user interaction. Webpacker can be used, but is not mandatory.

With basemate, you can implement both static and dynamic custom components.
