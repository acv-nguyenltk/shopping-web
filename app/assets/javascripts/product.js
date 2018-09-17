function showDetailProduct(id){
  req = $.ajax({
    url: '/products/' + id,
  });
  req.done(function(data){
    $('#cart').modal('hide');
    htmlChange(data);
    $('#showItem .modal-body').html(htmlChange(data));
    $('#showItem').modal('show');
  });
  req.fail(function(data){
    alert('Show failed');
  });
};

function updateProduct(id){
  var name = $('#name').val();
  var price = $('#price').val();
  var description = $('#description').val();
  var data = { name: name, price: price, description: description };
  req = $.ajax({
    url: '/products/' + id,
    data: { product: data },
    type: 'PUT'
  });

  req.done(function(){
    alert('Update is successed');
  });
  
  req.fail(function(){
    alert('Update is failed');
  })
}

function htmlChange(data){
  var html = '<div id="showItem">' +
            '<div class="row">' +
              '<div>' +
                '<div class="float-left">' +
                  '<img src="'+ data.imgUrl +'" height="50%" width="50%"> ' +
                '</div>'+
                '<div class="inline">' +
                  '<div>'+ 'Name : ' +
                    '<input id="name" type="text" value="' + data.name + '">' +
                  '</div>'+
                  '<div>'+ 'Price : ' +
                    '<input id="price" type="text" value="' + data.price + '">' +
                  '</div>'+
                  '<div>'+ 'Description : ' +
                    '<textarea id="description">' + data.description + '</textarea>' +
                  '</div>'+
                '</div>'+
              '</div>' +
              '<br>' +
              '<div>'+
                '<button type="button" class="btn btn-primary update_product" onclick="updateProduct('+ data.id +')">Update</button>' +
              '</div>'+
            '</div>' +
          '</div>' +
          '<div class="clearfix"></div>';
  return html;
}
