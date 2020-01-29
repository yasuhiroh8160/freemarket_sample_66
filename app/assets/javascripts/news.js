function keyup(elem){
  var num = $('#input').val();
  if (num.match(/\d+/)) { 
    if(num>=300 && num<=9999999){
      var commission=$('#input').val()*0.1;
      $('#commission').text("¥"+Math.floor(commission).toString().replace(/\B(?=(\d{3})+(?!\d))/g,','));

      var profit=$('#input').val()-commission;
      $('#profit').text("¥"+Math.ceil(profit).toString().replace(/\B(?=(\d{3})+(?!\d))/g,','));
    }
    else{
      $('#commission').text("-")
      $('#profit').text("-")
    }
  }
}
$(document).on('turbolinks:load', ()=> {
  //ファイル選択時に画像を表示する。
  $(function(){
    $('#image-box').on('change', function (e) {
      var reader = new FileReader();
      reader.onload = function (e) {
        $("#preview").attr('src', e.target.result);
        $('#preview').removeAttr('id');
      }
      reader.readAsDataURL(e.target.files[0]);
      $('#drop-area5').removeClass('active');
    });
  })
})

$(document).on('turbolinks:load', ()=> {
  // 画像用のinputを生成する関数
  const buildImage = (index)=> {
    const html = `<li upload-item="${index}" id="picture${index}" class="upload-item active">
                    <figure>
                      <img id="preview">
                    </figure>
                    <div class="button">
                    <a href=“#”, class= 'destroy'>削除</a> 
                    </div>
                  </li>`;
    return html;
  }

  let fileIndex = [1,2,3,4,5,6,7,8,9,10];

  $('#image-box').on('change', '.drop-file-area', function(e) {
    $('#have-items').append(buildImage(fileIndex[0]));
    var input_name = (fileIndex[0])
    fileIndex.shift();
    fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
    $("#picture"+input_name).addClass("pic")
  });
});




$(document).on('turbolinks:load', ()=> {
  const buildFileField = (index)=> {
    const html = `<label data_index="${index}" id="drop-area${index}" class="none">
                    <input class="drop-file-area" type="file" multiple="true"
                    name="product[images][]"
                    id="product_images_attributes_${index}_src"><br>
                    <pre>ドラッグアンドドロップ</br>またはクリックしてファイルをアップロード</pre>
                  </label>`;
    return html;
  }

  let fileIndex = [1,2,3,4,5,6,7,8,9,10];

  $('#image-box').on('change', '.drop-file-area', function(e) {
   
    $('#image-box').append(buildFileField(fileIndex[0]));
    var input_name =(fileIndex[0])
    fileIndex.shift();
    fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
    $(".active").removeClass("active");
    $("#drop-area"+input_name).addClass("active")
  });

});







$(document).on('turbolinks:load', function() {
  $(function(){
    function appendOption(category){
      var html = `<option value="${category.id}" data-category="${category.id}">${category.name}</option>`;
      return html;
    }
    // 子カテゴリーを表示するビュー
    function appendChidrenBox(insertHTML){
      var childSelectHtml = '';
      childSelectHtml = `<div class='select-wrap children' id= 'category-child'>
                            <i class='fas fa-chevron-down'></i>
                            <select class="select-default" id="child_category" required>
                              <option label="---" data-category="---"></option>
                              ${insertHTML}
                            </select>
                          </div>
                        </div>`;
      $('#category').append(childSelectHtml);
    }
    // 孫カテゴリーを表示するビュー
    function appendGrandchidrenBox(insertHTML){
      var grandchildSelectHtml = '';
      grandchildSelectHtml = `<div class='select-wrap children' id= 'category-grand-child'>
                                <i class='fas fa-chevron-down'></i>
                                <select name='product[category_id]' class="select-default" id="grandchild_category" required>
                                  <option label="---" data-category="---"></option>
                                  ${insertHTML}
                                </select>
                              </div>
                            </div>`;
      $('#category').append(grandchildSelectHtml);
    }
    // 親カテゴリー選択のイベント
    $('#parent_category').on('change', function(){
      var parentCategory = $('option:selected',this).val();
      if (parentCategory != "---"){
        $.ajax({
          url: '/products/get_category_children',
          type: 'GET',
          data: { parent_id: parentCategory },
          dataType: 'json'
        })
        .done(function(children){
          $('#category-child').remove();
          $('#category-grand-child').remove();
          var insertHTML = '';
          children.forEach(function(child){
            
            insertHTML += appendOption(child);
          });
          appendChidrenBox(insertHTML);
        })
        .fail(function(){
          alert('カテゴリー取得に失敗しました');
        })
      }else{
        $('#category-child').remove();
        $('#category-grand-child').remove();
        $('#size').remove();
        $('#brand').remove();
      }
    });
    // 子カテゴリー選択後のイベント
    $('#category').on('change', "#child_category",function(){
      var childId = $('option:selected',this).val();;
      if (childId != "---"){
        $.ajax({
          url: '/products/get_category_grandchildren',
          type: 'GET',
          data: { child_id: childId },
          dataType: 'json'
        })
        .done(function(grandchildren){
          if (grandchildren.length != 0) {
            $('#category-grand-child').remove();
            var insertHTML = '';
            grandchildren.forEach(function(grandchild){
              insertHTML += appendOption(grandchild);
            });
            
            appendGrandchidrenBox(insertHTML);
          }
        })
        .fail(function(){
          alert('カテゴリー取得に失敗しました');
        })
      }else{
        $('#category-grand-child').remove();
      }
    });

    $('#category').on('change', "#grandchild_category",function(){
      $("#size").css('display','block');
      $("#brand").css('display','block');
    })
  });




  
  $(function(){
    function appendOption(delivery){
      var html = `<option value="${delivery.id}" data-category="${delivery.id}">${delivery.name}</option>`;
      return html;
    }
  
    function appenddeliveryBox(insertHTML){
      var shippingSelectHtml = '';
      shippingSelectHtml = `<div class='form-group deliveries' id='delivery-child'
                                <label>
                                  配送の方法
                                  <span class='form-require'> 必須 </span>
                                </label>
                                <div class='select-wrap' >
                                  <i class='fas fa-chevron-down'></i>
                                  <select name='product[shipping_id]' class="select-default" id="shipping" required>
                                    <option label="---" data-category="---"></option>
                                    ${insertHTML}
                                  </select>
                                </div>
                              </div>`;
      $('#delivery').after(shippingSelectHtml);
    }
  
    $('#delivery').on('change', function(){
      var delivery = $('option:selected',this).val();
      if (delivery == "1"){
        $.ajax({
          url: '/products/get_shipping_PayFormer',
          type: 'GET',
          data: { delivery_id: delivery },
          dataType: 'json'
        })
        .done(function(deliveries){
          $('#delivery-child').remove()
          var insertHTML = '';
          deliveries.forEach(function(delivery){
            
            insertHTML += appendOption(delivery);
          });
          appenddeliveryBox(insertHTML);
        })
        .fail(function(){
          alert('カテゴリー取得に失敗しました');
        })
      }else if (delivery == "2") {
        $.ajax({
          url: '/products/get_shipping_PayGuest',
          type: 'GET',
          data: { delivery_id: delivery },
          dataType: 'json'
        })
        .done(function(deliveries){
          $('#delivery-child').remove();
          var insertHTML = '';
          deliveries.forEach(function(delivery){
            
            insertHTML += appendOption(delivery);
          });
          appenddeliveryBox(insertHTML);
        })
        .fail(function(){
          alert('カテゴリー取得に失敗しました');
        })
      }
      else{
        $('#delivery-child').remove();
      }
    });
  })
});


