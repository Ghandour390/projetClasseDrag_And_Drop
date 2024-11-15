fetch("./classe-project.json")
    .then((Response) => Response.json())
    .then((data) => display(data));

function display(items){
    const listCards = document.getElementById("list");
    listCards.innerHTML = htmlContent(items) /*`

    
  <div class="col-md-2">
  <img
  src="https://th.bing.com/th/id/OIP.HX6SHFUqvejaWJg9UH7uvgHaHX?rs=1&pid=ImgDetMain"
  class="rounded-circle"
  alt="Sample image"
  width="75px"
  />
  </div>

   <div class="col-md-2"></div>
   <div class="col-md-8">
   <div class="row"><h3>${items.non} ${items.prenom}</h3></div>
   <div class="row"><span>${items.dateNaissance}</span></div>
   <div class="row">${items.fonction}</div>
   </div>
   </div>
    `*/
}
   

function htmlContent(items){
    let htmlItems = ""; 

    for (let element in items) {
        items[element].forEach(item => {
       htmlItems+=  `<div class="col-md-2">
  <img
  src="https://th.bing.com/th/id/OIP.HX6SHFUqvejaWJg9UH7uvgHaHX?rs=1&pid=ImgDetMain"
  class="rounded-circle"
  alt="Sample image"
  width="75px"
  />
  </div>

   <div class="col-md-2"></div>
   <div class="col-md-8">
   <div class="row"><h3>${item.nom} ${item.prenom}</h3></div>
   <div class="row"><span>${item.dateNaissance}</span></div>
   <div class="row">${item.fonction}</div>
   </div>
   </div>`

        });
    } return htmlItems 
    





}