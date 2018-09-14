

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

});

function appendDataToPopup(res){
  var html = '';
  $.each(res["data_product"], function (k, v){
  	$.each(res["data_session"], function (kk, vv){
  		if(kk == v.id){
        html += '<div class="col-md-12" id="cart-item-' + v.id + '">' +
                  '<div class="row">' +
                    '<div class="col-md-8 modal-cart-content">' +
                      '<img  src="' + v.imgUrl + '" />' +
                      '<div><a href="/products/' + v.id + '">' + v.name + '</a></div>' +
                      '<div>' + v.price + '$</div>' +
                      '<div>' + vv + '</div>' +
                    '</div>' +
                  '</div>' +
                '</div>' +
                '<div class="clearfix"></div>';
  		}
  	})
  })
  return html;
};
