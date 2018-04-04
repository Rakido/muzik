// var pictureInput = document.querySelector(".js-picture-upload-input-with-preview");
// pictureInput.addEventListener("change", pictureUploadPreview, true);

// function pictureUploadPreview() {
//   var fileList                    = this.files;
//   var file                        = fileList[0];

//   var displayPreviewTargetClass   = "." + this.dataset.target;
//   var displayPreviewTargetElement = document.querySelector(displayPreviewTargetClass);

//   var reader = new FileReader();
//   reader.onloadend = function(){
//     displayPreviewTargetElement.classList.add('picture-upload-preview');
//     displayPreviewTargetElement.style.backgroundImage = "url(" + reader.result + ")";
//   }

//   if (file) {
//     reader.readAsDataURL(file);
//   }
// }

// ----- autre methode ----------
// <script src="http://code.jquery.com/jquery-3.1.0.min.js"
//   integrity="shaa256-cCueBR6CsyA4/9szpPfrX3s49M9vUU58gtiJj06wt/s="
//   crossorigin="anonymous">
//  </script>
//  <script type="text/javascript">
//   function readURL(input){
//    if(input.files && input.files[0]){
//     var reader = new FileReader();
//     reader.onload = function(e){
//      $('#preview img').attr('src', e.target.result);
//     };
//     reader.readAsDataURL(input.files[0]);
//    }
//   }
//   $(document).on('change','input[type="file"]',function(){
//    readURL(this);
//   });

//  </script>
