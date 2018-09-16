
$(document).ready(function(){

  $(document).on('click', '.open_cart',function(){
    req = $.ajax({
      url: '/carts'
    });

    req.done(function(res){
      appendDataToPopup(res);
      $('#cart .modal-body').html(appendDataToPopup(res));
      $('#cart').modal('show');
    });

  });

  $(document).on('click','.add_item',function(){
    req_add = $.ajax({
      url: "/carts/add/" + $(this).data('id'),
      method: "POST"
    });

    req_add.done(function(res){
      alert('Add item to cart is successed');
    });

    req_add.fail(function(res){
      alert('Add item to cart is failed');
    });
  });

  $(document).on('click','.change_quantity',function(){
    var id = $(this).data('id');
    var quantity = $(this).parent().find('.cart-item').val();
    req = $.ajax({
      url: "/carts/change/" + $(this).data('id'),
      method: 'POST',
      data: { quatity: quantity }
    });

    req.done(function(res){
      alert('Change quantity to cart is successed');
    });

    req.fail(function(res){
      alert('Change quantity to cart is failed');
    });
  });

  $(document).on('click','.delete_item',function(){
    var self = $(this);
    req = $.ajax({
      url: '/carts/remove/' + $(this).data('id'),
      method: 'DELETE'
    });
    
    req.done(function(){
      self.parent().remove();
      alert('Delete item cart is successed');
    });

    req.fail(function(){
      alert('Delete item cart is failed');
    })
  });

  $(document).on('click', '.empty_cart', function(){
    req = $.ajax({
      url: '/carts/empty',
      method: 'DELETE'
    });

    req.done(function(res){
      appendDataToPopup(res);
      $('#cart .modal-body').html(appendDataToPopup(res));
      alert('Empty cart is successed');
    });

    req.fail(function(){
      alert('Empty')
    })
  });

});

function appendDataToPopup(res){
  var html = '';
  $.each(res["data_product"], function (k, v){
  	$.each(res["data_session"], function (kk, vv){
  		if(kk == v.id){
        html += '<div class="col-md-12 abc" id="item">' +
                  '<div class="row">' +
                    '<div class="col-md-8">' +
                      '<img src="' + v.imgUrl + '" />' +
                      '<div><a href="/products/' + v.id + '">' + v.name + '</a></div>' +
                      '<div>' + v.price + '$</div>' +
                      '<input class="cart-item" type="number" value="' + vv + '">' +
                      '<button type="button" class="btn btn-primary change_quantity" data-id="'+ v.id +'">Change</button>' +
                      '<button type="button" class="btn btn-warning delete_item" data-id="' +v.id +'">Delete</button>' +
                    '</div>' +
                  '</div>' +
                '</div>' +
                '<div class="clearfix"></div>';
  		}
  	})
  })
  return html;
};
