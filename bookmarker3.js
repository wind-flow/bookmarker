$(document).ready(function(){

    $('#addPanelBtn').on('click', function(){
        $(this).css('display', 'none');
        $('#addPanelInput').css('display','block');
    });
    $('#savePanel').on('click', function() {
        var canvas = $('.board-canvas');
        var panel = $('.panel-add');
        var panelTitle = $('#panelTitle');
        var createPanelTemplate = function(title, color) {
            return '<div class="panel-wrapped">\
                        <div class="panel" style="background-color:' + color + '">\
                            <h2 class="panel-title">' + title + '</h2>\
                            <div class="panel-menu">\
                                <button class="addfolder js-add-card">Add a folder</button>\
                                <div class="add-card-form" style="display: none">\
                                    <input type="text" name="input" class="board-make-input" autocomplete="off" autocorrect="off" spellcheck="false" placeholder=" Add a folder">\
                                    <input type="button" value="SAVE" class="save-button js-save-card">\
                                    <button class="delete-button"><span class="fa fa-times fa-1x" aria-hidden="true"></span></button>\
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
        $('#addPanelBtn').css('display', 'block');
        $('#addPanelInput').css('display','none');
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

    // $(document).on("click", ".delete-button",function(){
    //     $(".board-make").remove()
    //     $(".board-make-input").remove()
    //     $(".save-button").remove()
    //     $(".delete-button").remove()
    //     $(".fa fa-times fa-1x").remove()
    
    //     var addfolder = document.createElement("button")
    //     $(addfolder).attr({
    //         "class" : "addfolder"
    //     })    
    //     $(addfolder).html("Add a folder")

    //     $(".panel").append(addfolder);
    // });
});