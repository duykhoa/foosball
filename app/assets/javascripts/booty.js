var Booty = {
  init: function() {
    Booty.sideNav();
    Booty.enableSelectField();
  },
  sideNav: function() {
    $('.button-collapse').sideNav({
          menuWidth: 300, // Default is 240
          edge: 'right', // Choose the horizontal origin
          closeOnClick: true // Closes side-nav on <a> clicks, useful for Angular/Meteor
        }
      );
  },
  enableSelectField: function() {
    $('select').material_select();
  }
}

window.Booty = Booty;
