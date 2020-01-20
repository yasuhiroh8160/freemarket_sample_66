function keyup(elem){
  var num = $('#input').val();
  if (num.match(/\d+/)) { 
    if(num>=300 && num<=9999999){
      var commission=$('#input').val()*0.1;
      $('#commission').text("¥"+Math.floor(commission));

      var profit=$('#input').val()-commission;
      $('#profit').text("¥"+Math.ceil(profit).toString().replace(/\B(?=(\d{3})+(?!\d))/g,','));
    }
    else{
      $('#commission').text("-")
      $('#profit').text("-")
    }
  }
}

$(function(){
  $('#category-pearent').on('change',function(){
    //一度出ている子要素のselectを消す
    $('.children').css('display','none');
    //ここでpearentのvalueを取得
    var pearent = $('option:selected').val();
    //子要素のidにペアレントの番号(value)を追加する
    var child = $('#category-child'+pearent);
    //対応したidを持つ子要素を表示する
    $(child).css('display','block');
    
  })
})

$(function(){
  $('.children').on('change',function(){
    $('.grand-children').css('display','none');
    var child = $('option:selected',this).val();
    var grandchild = $('#category-grand-child'+child);
    console.log(grandchild)
    $(grandchild).css('display','block');
  })
})



$(function(){
  $('#delivery').on('change',function(){
    $('.delivarys').css('display','none');
    var pearent = $('option:selected',this).val();
    var child = $('#delivery-child' +pearent);
    $(child).css('display','block');
  })
})

// //ドラックアンドドロップの記述。未完成。実装予定
// $(function(){
//   $('#drop-area').on('dragover',function(e){
//     e.preventDefault();
//     console.log('dragover')
//   });
//   $('#drop-area').on('drop',function(e){
//     e.preventDefault();
//     $('#drop-upload-file').files = e.originalEvent.dataTransfer.files;
//     console.log(files)
//   })
// })


//ファイル選択時に画像を表示する。
$(function(){
  $('#drop-upload-file').on('change', function (e) {
    var reader = new FileReader();
    reader.onload = function (e) {
      $("#preview").attr('src', e.target.result);
    }
    reader.readAsDataURL(e.target.files[0]);

    $('.upload-item').css('display','block');
    $('#drop-area').css('margin-left','2%');
    var inputW =$('#drop-area').width();
    if(inputW<=10){
      $('#drop-area').css('display','none');
    }
  });

})


// $(function(){
//   $('#preview').on('load',function(e){
//     console.log(this)
//     $('#preview').remove()

//   })
// })

