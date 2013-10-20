//= require "jquery"
//= require "jquery-ui-1.10.3.custom"
//= require_self

$(function(e){
  var body = $("body");

  // Handle NSFW and Spoiler templates
  body.on("click", "a[data-reveal]", function(e){
    e.preventDefault();
    var self = $(this);
    $(self.data("reveal")).show();
  });
  
  // Handle NSFW and Spoiler templates
  body.on("click", "a[data-hide]", function(e){
    e.preventDefault();
    var self = $(this);
    $(self.data("hide")).hide();
  });

  body.on("click", "a.back-button", function(e){
    e.preventDefault();
    window.history.back();
  })

  body.tooltip();

  // Make all external links open in a new window.
  $("a[href^='http://'], a[href^='https://']").attr("target","_blank");
  // Q: Why didn't you do this in your site builder?
  // A: The markdown library I'm using has no option for this.
  // 
  // Q: Why didn't you use a markdown library that allows this?
  // A: The other libraries don't support other features I'm using from this one.
  //
  // Q: Why didn't you do [Link](link){: target=_blank}?
  // A: I tried it. Didn't work.
  //
  // Q: Why didn't you build an extension to process the html during the build?
  // A: Middleman doesn't have a hook to insert any kind of html transformation. 
  //
  // Q: Why didn't you build a post processor that would convert links after the html was generated? 
  // A: Didn't feel like doing that much work.
  // 
  // Q: I have javascript turned off and this doesn't work for me.
  // A: If you're smart enough to turn javascript off, you're smart enough to open links in new tabs manually. 
  //
  // Q: What about people that accidentally turned javascript off?
  // A: They can call their doctor's office and complain about my blog not working. 
});