MatestackUiCore.Vue.component('components-header', {
  mixins: [MatestackUiCore.componentMixin],
  data: function(){
    return {
      open: false,
      expanded: false,
      showHeaderShadow: false
    }
  },
  methods: {
    sidebarToggle: function() {
      var element = document.getElementById("wrapper");
      if (this.open == false) {
        this.open = true;
        element.style.marginLeft = "0px"
      } else {
        this.open = false;
        element.style.marginLeft = "-280px"
      }
    },
  }
});
