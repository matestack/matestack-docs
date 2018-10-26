
basemate melts Rails and Vue.js down to one holistic Web Dev Framework.
By progressively replacing the classic View-Layer, basemate deeply integrates a
Vue.js based UI into Rails, offering optional prebuilt components. Use it to
write dynamic Web-UIs with minimum effort and maximum dev happiness.

## What exactly is basemate?
**basemate = Rails + Vue.js**

basemate is a Rails Engine, turning the MVC-Framework Ruby on Rails into a
state-of-the-art Fullstack Web-Development Framework.
With basemate you are able to write dynamic Web-Apps in pure Ruby. HTML, CSS
and JavaScript are only used for adding special, custom UI behaviour that exceeds
basemate's core functionality. The main goals are:

- Reduction of complexity of modern web development, moving front and backend closer together
- More maintainable UI code, using a component-based structure written in Ruby
- Increased development speed and happiness, offering prebuilt UI-Components for classic requirements
- Modern, dynamic UI feeling without the need to implement a separate JavaScript Application

basemate progressively replaces the classic Rails-View-Layer. You are able to use
it alongside your classic views and incrementally turn your Rails-App into a
dynamic, more maintainable Web-App.

## Why basemate?

Back in the days, we fell in love with Rails because it was simple to create
applications using just Ruby and not much else. Nowadays, Web Apps often have to
be dynamic. Users don’t enjoy static request-response websites with constant
full page reloads. They are used to native Apps and the so called “App-feeling”.
Right now, Rails doesn’t serve you well here.

To get this feeling, we started to create fullblown Javascript applications and
reduced Rails to a pure JSON API. Now we got that dynamic “App-feeling”
on our UIs, but increased the complexity in our development by introducing a separate
full-blown frontend framework. Implementing two separate systems (backend-api,
frontent-app) is a pain: Two different code bases, two repositories to maintain,
two different deployment schedules, two test environments, two everything...!

This sophisticated architecture for sure offers a lot of flexibility and
possibilites how to extend your systems. But you know what? We didn’t need that
flexibility! In 90% of our projects, we just had to create a straight forward
app for a small to medium-size company but ended up setting up an architecture
which would be suitable for big enterprises with lots of engineers and big budgets.

To escape this, we made a step back and rethought the way Web Apps are implemented
today, thinking about the biggest pain points we were facing when creating modern Web UIs
and called it the “frontend hustle”. We realized that we still love most concepts
of Rails. But we were missing a good approach to easily define a maintainable,
dynamic UI deeply integrated into Rails. That's why basemate was born!

Originally invented to reduce our own pain in development and using it in our
daily business, we started to really love basemate and thought of sharing it
with the world! Now we’re on the search for other developers to improve and use the
architecture in a community of mates! So if you’re with us:

Escape the frontend hustle. Create maintainable, dynamic and beautiful UIs easily. Use basemate.

## How does it work?

Imagine: You want to add a comment section to your UI, displaying the latest 5 comments.
Users should be able to create and to delete comments. All actions should be
performed asynchronously without a full page-reload. AND: New comments should
be pushed to the client via websockets. Sounds complicated?

Let's have a look on how following dynamic UI is implemented in basemate:
