// NOTE: The contents of this file will only be executed if
// you uncomment its entry in "assets/js/app.js".

// Bring in Phoenix channels client library:
import {Socket} from "phoenix"

// And connect to the path in "lib/discuss_web/endpoint.ex". We pass the
// token for authentication. Read below how it should be used.
let socket = new Socket("/socket", {params: {token: window.userToken}})


socket.connect()


const createSocket = (topicId) => {
let channel = socket.channel(`comments:${topicId}`, {});
channel.join()
  .receive("ok", resp => { 
    console.log("Hello I joined first Socket")
    renderComments(resp.comments) })
  .receive("error", resp => { console.log("Unable to join", resp) });

  channel.on(`comments:${topicId}:new`, renderComment)
  
  document.querySelector('button').addEventListener('click', () => {
    const content = document.querySelector('textarea').value ;
    channel.push('comment:add', {content: content});
  });

};


 
function renderComments(comments) {
  const renderedComments = comments.map(comment => {
    return commentTemplate(comment);
  });
  document.querySelector('.collection').innerHTML = renderedComments.join('')
};

function renderComment(comment){
  const renderedComment = commentTemplate(comment);
  document.querySelector('.collection').innerHTML += renderedComment;
};

function commentTemplate(comment){
  let email = 'Anonymous';
  if(comment.user) {
    email = comment.user.email ;
  }
  return `
    <li class ="collection-item">
    ${comment.content} 
    <div class="secondary-content">
    ${email}
    </div>
    </li>
    `;
};

window.createSocket = createSocket ; 



