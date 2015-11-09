var Booty = {
  init: function() {
    Booty.sideNav();
    Booty.enableSelectField();
    Booty.storeDuplicatedForm();
  },
  sideNav: function() {
    $('.button-collapse').sideNav({
      menuWidth: 300, // Default is 240
      edge: 'right', // Choose the horizontal origin
      closeOnClick: true // Closes side-nav on <a> clicks, useful for Angular/Meteor
    });
  },
  enableSelectField: function() {
    $('select').material_select();
  },
  storeDuplicatedForm: function() {
    if ($('.duplicatable_nested_form').length) {
      nestedForm = $('.duplicatable_nested_form').last().clone();
      $(".destroy_duplicate_nested_form:first").remove();
      Booty.addDuplicatableNestedForm();
      Booty.destroyDuplicatableNestedForm();
    }
  },
  addDuplicatableNestedForm: function() {
    $('a.add-nested-form').on('click', function(e){
      e.preventDefault();
      lastNestedForm = $('.duplicatable_nested_form').last();
      newNestedForm = $(nestedForm).clone();
      formsOnPage = $('.duplicatable_nested_form').length;

      $(newNestedForm).find('label').each(function() {
        var newLabel, oldLabel;
        oldLabel = $(this).attr('for');
        newLabel = oldLabel.replace(new RegExp(/_[0-9]+_/), "_" + formsOnPage + "_");
        return $(this).attr('for', newLabel);
      });

      $(newNestedForm).find('select, input').each(function() {
        var newId, newName, oldId, oldName;
        oldId = $(this).attr('id');
        newId = oldId.replace(new RegExp(/_[0-9]+_/), "_" + formsOnPage + "_");
        $(this).attr('id', newId);
        oldName = $(this).attr('name');
        newName = oldName.replace(new RegExp(/\[[0-9]+\]/), "[" + formsOnPage + "]");
        $(this).val("");
        return $(this).attr('name', newName);
      });

      $(newNestedForm).insertAfter(lastNestedForm);
    });
  },
  destroyDuplicatableNestedForm: function() {
    $('.destroy_duplicate_nested_form').on('click', function(e) {
      $(this).closest('.duplicatable_nested_form').slideUp().remove()
    });
  }
}

window.Booty = Booty;
