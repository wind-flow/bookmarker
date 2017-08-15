$(document).ready(function(){

    $('.js-add-panel').on('click', function(){
        $(this).css('display', 'none');
        $('.js-panel-input').css('display','block');
    });
    $('.js-save-panel').on('click', function() {
        var canvas = $('.board-canvas');
        var panel = $('.panel-add');
        var panelTitle = $('.js-panel-title');
        var createPanelTemplate = function(title, color) {
            return '<div class="panel-wrapped">\
                        <div class="panel" style="background-color:' + color + '">\
                            <h2 class="panel-title">' + title + '</h2>\
                            <input class="thVal" type="text" style="display: none">\
                            <div class="panel-menu">\
                                <button class="addfolder js-add-card">Add a bookmark</button>\
                                <div class="add-card-form" style="display: none">\
                                    <input type="text" name="input" class="board-make-input" autocomplete="off" autocorrect="off" spellcheck="false" placeholder=" Add a folder">\
                                    <input type="button" value="SAVE" class="save-button js-save-card">\
                                    <button class="delete-button js-delete-btn"><span class="fa fa-times fa-1x" aria-hidden="true"></span></button>\
                                </div>\
                            </div>\
                            <ul class="card-list">\
                            </ul>\
                        </div>\
                    </div>'
        }
        var createColor = function() {
            var colors = ['#ff5000', '#008000', '#f00000', '#333', '#fff000']
            var rand = Math.floor(Math.random() * colors.length);
            return colors[rand];
        }
        var getPanelTitel = function() {
            var title = panelTitle.val();
            panelTitle.val('');
            return title;
        }

        panel.before(createPanelTemplate(getPanelTitel(), createColor()));
        $('.js-add-panel').css('display', 'block');
        $('.js-panel-input').css('display','none');
    });

    $('.board-canvas').on('click', '.js-add-card', function() {
        var cardBtn = $(this);
        var panelMenu = cardBtn.parent();
        var cardInput = panelMenu.find('.add-card-form');
        panelMenu.css('background-color', '#eee');
        cardBtn.css('display', 'none');
        cardInput.css('display', 'block');
    });

    $('.board-canvas').on('click', '.js-save-card', function() {
        var saveBtn = $(this);
        var panelMenu = saveBtn.parents('.panel-menu')
        var cardList = panelMenu.siblings('.card-list');
        var cardInput = saveBtn.siblings('.board-make-input');
        var getCardLink = function() {
            var title = cardInput.val();
            cardInput.val('');
            return title;
        }
        var createCardTemplate = function(link) {
            return '<li class="card-item">\
                        <a class="card-link" href="' + link + '" target="_black">\
                            <img class="card-thumbnail" src="#" alt="#">\
                            <p class="card-txt">' + link + '</p>\
                        </a>\
                    </li>'
        }
        cardList.prepend(createCardTemplate(getCardLink()));
        panelMenu.css('background-color', 'transparent');
        panelMenu.find('.js-add-card').css('display', 'block');
        panelMenu.find('.add-card-form').css('display', 'none');
    })

//폴더생성취소
     $(document).on("click", ".js-delete-panel",function(){
         var deleteBtn = $(this);
         var panelInput = deleteBtn.parent();
         var panelAdd = panelInput.siblings('.js-add-panel');
         panelInput.css('display', 'none');
         panelAdd.css('display', 'block');
     });

//카드생성취소
    $(document).on("click", ".js-delete-btn",function(){
        console.log("dd");
         var deletecardBtn = $(this);
         var cardInput = deletecardBtn.parents('.add-card-form');
         var cardAdd = cardInput.siblings('.js-add-card');
         cardInput.css('display', 'none');
         cardAdd.css('display', 'block');
         cardAdd.parent().css('background-color', 'transparent');

     });

//폴더옮기기 도전
// $( ".panel" ).sortable({
//      connectWith: ".panel",
//      handle: ".panel-title",
//      start: function (event, ui) {
//        ui.item.addClass('tilt');
//      },
//      stop: function (event, ui) {
//        ui.item.removeClass('tilt');
//      }
//    });

    $(document).on('dblclick', ".panel-title", function (e) {
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



});
