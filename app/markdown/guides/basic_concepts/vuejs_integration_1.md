## Vue.js Integration

basemate uses Vue.js for its dynamic features. All dynamic components rely on a
Vue.js component in order to perform clientside logic. If you just use predefined
components, you actually don't need to care about this part ;)

basemate renders HTML on the serverside and wraps dynamic components with a special
component tag. Vue.js compiles this HTML and mounts Vue.js components on top of it.
These Vue.js components do whatever a Vue.js component can do. basemate doesn't
limit Vue.js functionality. This is especially important for developers, who want
to create their own dynamic components.

In order to pass specific data into a reusable component, a Vue.js component can
take so called "props". basemate uses these props, in order to pass in a component's
configuration written in pure Ruby while defining a basemate page.
