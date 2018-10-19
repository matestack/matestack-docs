## Summary
We've created a dynamic Todo-List without writing one line of JavaScript. We're
using the full power of Rails and simply added a dynamic UI on top of it without
breaking any concepts of Rails (Routing, Controller Actions, Strong Params).
Dynamic core components added Vue.js component instances to our UI without us
beeing aware of it. These components used an Vue.js event hub to communicate to
each other, performing dynamic rerendering after user interactions.

We've just covered the basics of basemate in this guide. On the next guides we will
learn how to customize the UI with some simple Javascript and create a
Single Page Application with dynamic page transitions with a basemate app instances
and basemate core components in pure Ruby.
