$(document).ready(function(){

    $('.js-add-panel').on('click', function(){
        $(this).css('display', 'none');
        $('.js-panel-input').css('display','block');
    });
    // $('.js-save-panel').on('click', function () {
    //     var canvas = $('.board-canvas');
    //     var panel = $('.panel-add');
    //     var panelTitle = $('.js-panel-title');
    //     var barMenu = $('.bar-menu');
    //     var createbarMenu = function (title) {
    //         return title
    //     };
    //     var createPanelTemplate = function (title, color) {
    //         return '<div class="panel-wrapped">\
    //                     <div class="panel" style="background-color:' + color + '">\
    //                         <h2 class="panel-title">' + title + '</h2>\
    //                         <button type="button" class="remove-button" href="#"><i class="fa fa-ellipsis-h fa-lg" aria-hidden="true"></i></button>\
    //                         <input class="thVal" type="text" style="display: none">\
    //                         <div class="panel-menu">\
    //                             <button class="addfolder js-add-card">Paste URL here</button>\
    //                             <div class="add-card-form" style="display: none">\
    //                                 <input type="text" name="input" class="board-make-input" autocomplete="off" autocorrect="off" spellcheck="false" placeholder=" Paste URL here">\
    //                                 <input type="button" value="SAVE" class="save-button js-save-card">\
    //                                 <button class="delete-button js-delete-btn"><span class="fa fa-times fa-1x" aria-hidden="true"></span></button>\
    //                             </div>\
    //                         </div>\
    //                         <ul class="card-list">\
    //                         </ul>\
    //                     </div>\
    //                 </div>';
    //     }
    //     // var createColor = function() {
    //     //     var colors = ['#c9ddff', '#c9ffdd', '#ffd2c9', '#c9caff', '#fdc9ff', '#fffdc9', '#c9fffc',
    //     //                      '#ffc9c9', '#ffe5c9', '#eaffc9'];
    //     //     var rand = Math.floor(Math.random() * colors.length);
    //     //     return colors[rand];
    //     // };
    //
    //     var title = panelTitle.val();
    //     panelTitle.val('');
    //
    //     panel.before(createPanelTemplate(title, createColor()));
    //     barMenu.append(createbarMenu(title));
    //     $('.js-add-panel').css('display', 'block');
    //     $('.js-panel-input').css('display', 'none');
    //
    // });


    $('.board-canvas').on('click', '.js-add-card', function() {
        var cardBtn = $(this);
        var panelMenu = cardBtn.parent();
        var cardInput = panelMenu.find('.add-card-form');
        panelMenu.css('background-color', '#eee');
        cardBtn.css('display', 'none');
        cardInput.css('display', 'block');
    });

    //카드 생성
    $('.board-canvas').on('click', '.js-save-card', function () {
        var saveBtn = $(this);
        var panelMenu = saveBtn.parents('.panel-menu');
        var cardList = panelMenu.siblings('.card-list');
        var cardInput = saveBtn.siblings('.board-make-input');
        var getCardLink = function () {
            var title = cardInput.val();
            cardInput.val('');
            return title;
        };
        var createCardTemplate = function (title, link, img) {
            return '<li class="card-item">\
                        <a class="card-link" href="' + link + '" target="_black">\
                            <img class="card-thumbnail" src="' + img + '" alt="#">\
                            <p class="card-txt">' + title + '</p>\
                        </a>\
                    </li>';
        }
        $.ajax({
            method: "POST",
            url: "/bookmks/add",
            data: {
              bookmkfolderid: saveBtn.attr("data-id"),
              bookmkTitle: cardInput.val()
            },
            success: function(data){
                if(data.isSuccess) {
                    cardList.prepend(createCardTemplate(data.title, data.link, data.imgUrl));
                    cardInput.val('');
                    panelMenu.css('background-color', 'transparent');
                    panelMenu.find('.js-add-card').css('display', 'block');
                    panelMenu.find('.add-card-form').css('display', 'none');
                } else {
                    alert("정확한 url을 입력해주세요.");
                    cardInput.val('');
                }
            }
        });
    })


//폴더생성취소
     $(document).on("click", ".js-delete-panel",function(){
         var deleteBtn = $(this);
         var panelInput = deleteBtn.parents('.js-panel-input');

         var panelAdd = panelInput.siblings('.addfolder');
        //  debugger;
         panelInput.css('display', 'none');
         panelAdd.css('display', 'block');
     });

//카드생성취소
    $(document).on("click", ".js-delete-btn",function(){
         var deletecardBtn = $(this);
         var cardInput = deletecardBtn.parents('.add-card-form');
         var cardAdd = cardInput.siblings('.js-add-card');
         cardInput.css('display', 'none');
         cardAdd.css('display', 'block');
         cardAdd.parent().css('background-color', 'transparent');

     });

    $(".panel-title").dblclick(function (e) {
       e.stopPropagation();      //<-------stop the bubbling of the event here
       var currentEle = $(this);
       var value = $(this).html();
       updateVal(currentEle, value);
    });


    function updateVal(currentEle, value) {
//      $(currentEle).html('<input class="thVal" type="text" value="' + value + '" />');
        var titleInput = currentEle.siblings('.thVal');
        titleInput.val(value);
        currentEle.css('display','none');
        titleInput.css('display','block');

      titleInput.focus();
      titleInput.keyup(function (event) {
          if (event.keyCode == 13) {
              $(currentEle).html(titleInput.val().trim());
              titleInput.css('display','none');
              currentEle.css('display','block');
          }
      });
    }

    $(".board-canvas").sortable({
      connectWith:".panel-wrapped",
      update: function(event, ui) {
        children = $(".panel");
           var sort = new Array()
           var bmkfolderid = new Array()
           for (x = 0; x < children.length; x++) {
             if(children[x].id != null){
               sort.push(children[x].id.slice(7,))
             }
           }
                $.post($(this).data('update-url'), {
                  "sequence" : sort
                })
             }
    })

});
