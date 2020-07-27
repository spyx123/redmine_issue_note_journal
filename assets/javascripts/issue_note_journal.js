$(document).ready(function() {
	var user = $('#loggedas > a').attr('href');
	$('[id*="note-"').each(function() {
		var html = $(this).find('ul.details').html();
		
		if(typeof(html) != "undefined" && html !== null) {
			if ($(this).find('ul.details').html().indexOf('<strong>Комментарий</strong>') != -1) {
				//комментарий
				var id = $(this).closest('[id*="change-"').attr('id').replace("change-", "");


				if (!$(this).closest('[id*="change-"').hasClass("has-notes")) {
					//комментарий удален
					$(this).find('ul.details').after('<div id="journal-'+id+'-notes" class="wiki"><p style="color: #959595;">Комментарий удален</p></div>');
			
					if ($(this).find('ul.details li:contains("Комментарий")').length > 0) //первый diff удаляем {}
					{
						$(this).find('ul.details li:contains("Комментарий")').each(function(index) {
  							$(this).remove();
  							return false; // breaks
						});
					}
				} else {

					if ($(this).find('ul.details li:contains("Комментарий")').length > 0) //первый diff удаляем {}
					{
						$(this).find('ul.details li:contains("Комментарий")').each(function(index) {
  							$(this).remove();
  							return false; // breaks
						});
					}	
				}
			}	
		}
	});
});
