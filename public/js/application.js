$(document).ready(function() {
  upvote()

});

function upvote(){
  $("div.row").on('submit', "form.upvote", function(event){
    event.preventDefault()
    $.ajax({
      method: 'post',
      url: $(this).attr('action'),
      context: this
    }).done(function(message){
      console.log($(this).find(">:first-child"))
      $(this).find(">:first-child").html(message)
    })
  })
}
