var VictoryTheme = VictoryTheme || {};

$(document).ready(function(){

  (function(){

    var isMobile = $('.menu-link').is(':visible');

    this.toggleClass = function(element,className) {
      if (element.hasClass(className)) {
        element.removeClass(className);
      } else {
        element.addClass(className);
      }
    }

    // Mobile nav scripting
    this.initNavigation = function(nav) {      
      if (nav.length && isMobile) {
        var dropdowns = nav.find('.drop').children('a');
        dropdowns.unbind();
        dropdowns.each(function(){
          $(this).click(function(e){
            e.preventDefault();
            VictoryTheme.toggleClass($(this).parent(),'opened');
          });
        });
      }
    }

    // Initialize on page load
    this.initialize = function() {

      var navBar = $('.topnav').eq(0);

      this.initNavigation(navBar);

    }

  }).apply(VictoryTheme);

  VictoryTheme.initialize();

});