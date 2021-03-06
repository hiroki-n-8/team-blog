$(function(){

  var search_list = $(".posts-list");

  function appendPost(post) {
    var html = `
    <div class="contributor col-md-10 col-md-offset-1">
        投稿チーム：${post.team_name}
    </div>
    <div class="posts col-md-10 col-md-offset-1">
        <p class="date">試合日：${post.game_date}</p>
        <p class="categories">${post.category}<a class="btn btn-info" href="/posts/${post.id}">詳細/動画・ハイライト</a></p>
        <p class="opponent text-center">${post.team_name}　vs　${post.opponent}</p>
      <div class="result text-right">
        ${post.result}
        <span class="mgl-20">${post.goal} - ${post.allow}</span>
      </div>
    </div>`
  search_list.append(html);
  }

  function appendErrMsgToHTML(msg){
    var html = `<div class='search-msg text-center'>${ msg }</div>`
    search_list.append(html);
  }

  $(".search-form").on("keyup", function(){
    var input = $(".search-form").val();
    $.ajax({
      type: 'get',
      url:'/posts/search',
      data:{ keyword: input},
      dataType: 'json'
    })
    .done(function(posts){
      search_list.empty();
      if (posts.length !== 0){
        posts.forEach(function(post){
          appendPost(post);
        });
      }
      else{
        appendErrMsgToHTML("一致する試合日がありません");
      }
    })
    .fail(function() {
      alert('error');
    });
  });
});