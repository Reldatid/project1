
//= require jquery
//= require rails-ujs
//= require activestorage
//= require_tree .

let makeTree = function(tree){
  $('#treeUL').append(recurseTree(tree));

  let toggler = document.getElementsByClassName("caret");

  for (i = 0; i < toggler.length; i++) {
    toggler[i].addEventListener("click", function() {
      this.parentElement.querySelector(".nested").classList.toggle("active");
      this.classList.toggle("caret-down");
    });
  }
}

let recurseTree = function(tree){
  console.log(tree.name);
  let $listItem = $("<li>");
  let $link = $(`<a href='${tree.id}' >`);
  $link.html(tree.name)
  if(tree.branches[0] != null){
  // create <li><span class="caret"></span> <a>Name</a> <ul>...</ul>
    let $span = $("<span class='caret'>");
    $listItem.append($span);
    $listItem.append($link);

    let $newList = $('<ul class="nested">');
    tree.branches.forEach(function(element){
      console.log("here");
      $newList.append(recurseTree(element));
    });
    $listItem.append($newList);
    console.log("there");
  }
  else{
    $listItem.attr('class', "base");
    $listItem.append($link);
  }
  return $listItem
}
