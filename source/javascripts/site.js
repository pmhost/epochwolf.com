// Handle NSFW and Spoiler templates
$(function(e){
  $("body").on("click", "a[data-reveal]", function(e){
    e.preventDefault();
    var self = $(this);
    $(self.data("reveal")).show();
  });

  $("body").on("click", "a[data-hide]", function(e){
    e.preventDefault();
    var self = $(this);
    $(self.data("hide")).hide();
  });
});