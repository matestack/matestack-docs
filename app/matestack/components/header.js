MatestackUiCore.Vue.component('components-header', {
  mixins: [MatestackUiCore.componentMixin],
  data: function(){
    return {
      sidebarOpen: false,
      expanded: false,
      showHeaderShadow: false
    }
  },
  methods: {
    sidebarToggle: function() {
      var sidebarElement = document.getElementById("sidebar");
      if (sidebarElement.classList.contains("closed")) {
        this.openSideBar();
      } else {
        this.closeSideBar();
      }
    },
    openSideBar: function(){
      var sidebarElement = document.getElementById("sidebar");
      var contentElement = document.getElementsByClassName("matestack-page-root")[0];
      this.sidebarOpen = true;
      contentElement.classList.remove("sidebar-closed")
      sidebarElement.classList.remove("closed")
      sidebarElement.classList.add("open")
    },
    closeSideBar: function(){
      var sidebarElement = document.getElementById("sidebar");
      var contentElement = document.getElementsByClassName("matestack-page-root")[0];
      this.sidebarOpen = false;
      contentElement.classList.add("sidebar-closed")
      sidebarElement.classList.add("closed")
      sidebarElement.classList.remove("open")
    },
    resizeCallback: function(){
      if (window.innerWidth <= 768){
        this.closeSideBar();
      } else {
        this.openSideBar();
      }
    }
  },
  mounted: function(){
    if (window.innerWidth <= 768){
      this.sidebarOpen = true;
    }
    window.addEventListener('resize', this.resizeCallback);
    var self = this;
    MatestackUiCore.matestackEventHub.$on("page_loaded", function(){
      if (window.innerWidth <= 768){
        self.closeSideBar();
      }
    })
    MatestackUiCore.matestackEventHub.$on("page_loading_triggered", function(){
      if (window.innerWidth <= 768){
        self.closeSideBar();
      }
    })
  }
});
