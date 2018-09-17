$(document).ready(function(){
  var save = function(selector){
    $(selector).addClass('d-none');
    $(selector).parent().find('.edit-product').removeClass('d-none');
    $(selector).parent().find('.cancel-product').addClass('d-none');
    $(selector).parents().find('input').prop('disabled', true);
    $(selector).parents().find('textarea').prop('disabled',true);
  };

  var edit = function(selector){
    $(selector).addClass('d-none');
    $(selector).parent().find('.save-product').removeClass('d-none');
    $(selector).parent().find('.cancel-product').removeClass('d-none');
    $(selector).parents().find('input').prop('disabled', false);
    $(selector).parents().find('textarea').prop('disabled',false);
  };

  var cancel = function(selector){
    $(selector).addClass('d-none');
    $(selector).parent().find('.edit-product').removeClass('d-none');
    $(selector).parent().find('.save-product').addClass('d-none');
    $(selector).parents().find('input').prop('disabled', true);
    $(selector).parents().find('textarea').prop('disabled',true);
  }

  $('.edit-product').on('click',function(){
    edit($(this));
  });

  $('.save-product').on('click',function(){
    var click = $(this);
    var name = $('#name').val();
    var price = $('#price').val();
    var description = $('#description').val();
    var id = $(this).parents('tr').data('id');
    var data = { name: name, price: price, description: description };
    req = $.ajax({
      url: '/products/' + id,
      data: { product: data },
      type: 'PUT',
      success: function(data){
        $('#name').val(data.name);
        $('#price').val(data.price);
        $('#description').val(data.description);
        save(click);
      },
      error: function(){
        alert('Update is failed');
      }
    });
  });

  $('.cancel-product').on('click',function(){
    cancel($(this));
  });
})
