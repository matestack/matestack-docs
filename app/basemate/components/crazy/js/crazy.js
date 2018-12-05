BasemateUiCore.Vue.component('crazy-cell', {
  mixins: [BasemateUiCore.componentMixin],
  data: function data() {
    return {
      hello: "world",
      users: []
    };
  },
  mounted: function(){
    var self = this;
    setTimeout(function () {
      self.rerender();
    }, 2000);
  },
  methods: {
    callApi: function() {
      var self = this;
      BasemateUiCore.axios.get("/api/users.json").then(function(response){
        self.users = response.data;
      });
    }
  }
});
