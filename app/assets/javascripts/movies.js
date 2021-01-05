/*
# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
*/


function addNewMovieComment(){
  const newCommentInput = jQuery('.new-comment-input')[0];
  const loadingSpinerWrapper = jQuery('.spinner-wrapper')[0];
  const newCommentInputWrapper = jQuery('.comment-input-wrapper')[0];
  const noCommentWritten = jQuery('.no-comment-written')[0];

  const value = newCommentInput.value
  let movieId = window.location.pathname.split('/')
  movieId = movieId[movieId.length - 1]

  const payload = {
    type:'Comment',
    content: value,
  }

  loadingSpinerWrapper.style.display = 'flex'
  newCommentInputWrapper.style.display = 'none'

  fetch(`/movies/${movieId}/feedbacks.json`,{
    method: 'POST',
    body: JSON.stringify(payload),
    headers: {
      'X-CSRF-Token': $("meta[name='csrf-token']").attr("content"),
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    },
    credentials: "same-origin",
  }).then((resp)=>{
    if(resp.status == 200){
      return resp.json()
    }
    noCommentWritten.style.display = 'block'
  }).then((resp)=>{
    const { feedback, user_name }=resp;

    const newComment = document.createElement('div')
    newComment.setAttribute('class','show-movie-comment-brick')

    const imageWrapper = document.createElement('div')
    const imageElement = document.createElement('img')
    imageElement.setAttribute('src','/assets/default_avatar.jpg')
    imageElement.setAttribute('class','show-movie-staff')
    imageWrapper.appendChild(imageElement)

    newComment.appendChild(imageWrapper)

    const commentWrapper = document.createElement('div')
    commentWrapper.setAttribute('class','show-movie-comment')
  
    const credWrapper = document.createElement('div')
    credWrapper.innerText=`${user_name} ${feedback.created_at}`
    commentWrapper.appendChild(credWrapper)

    const contentWrapper = document.createElement('div')
    contentWrapper.setAttribute('class','show-movie-comment-content')
    contentWrapper.innerText = feedback.content
    commentWrapper.appendChild(contentWrapper)

    newComment.appendChild(commentWrapper)

    const commentContanier = jQuery('.show-movie-comments-container')[0]
    commentContanier.appendChild(newComment)

    noCommentWritten.style.display = 'none'
    newCommentInput.value = ''
  }).finally(()=>{
    loadingSpinerWrapper.style.display = 'none'
    newCommentInputWrapper.style.display = 'flex'
  })
}
