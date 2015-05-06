// function display_search_results(){
// 		if(this.readyState === 4){
// 			console.log(this);
// 			document.getElementById('products').innerHTML = this.responseText;
// 		}
// 	}

$(document).on('ready page:load', function(){
	if ($('.pagination').length) {
    $(window).scroll(function() {
      var url = $('.pagination span.next').children().attr('href');
      if (url && $(window).scrollTop() > $(document).height() - $(window).height() - 50) {
        $('.pagination').text("Fetching more products...");
        return $.getScript(url);
      }
    });
  }

	$('#search_form').submit(function(event){
		event.preventDefault();
		var searchValue = $('#search').val();

		$.getScript('/products?search=' + searchValue);
	});

  //Still not quite working
 $("#new_review")
  .on('ajax:beforeSend', function() { // set this code to happen just before the ajax request is made
    $("input[type='submit']") // make changes to the submit button
      .val('Saving...') // change the text on the button
      .attr('disabled', 'disabled'); // disable the button
  })
  .on('ajax:complete', function() {
    $("input[type='submit']")
      .val('Create Review')
      .removeAttr('disabled');
  });
});



