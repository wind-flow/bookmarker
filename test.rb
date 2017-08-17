
<div class="board-canvas">
   <%= @object.title %>
   <% @categories.each do |category| %>
   <div class="panel-wrapped">
       <div class="panel" style="background-color: <%= category.color %>">
           <h2 class="panel-title"><%= category.title %></h2>
           <input class="thVal" type="text" style="display: none">
           <div class="panel-menu">
               <button class="addfolder js-add-card">Paste URL here</button>
               <div class="add-card-form" style="display: none">
                   <input type="text" name="input" class="board-make-input" autocomplete="off" autocorrect="off" spellcheck="false" placeholder=" Add a folder">
                   <input type="button" value="SAVE" class="save-button js-save-card" data-categoryid="<%= category.id%>">
                   <button class="delete-button js-delete-btn" type="button"><span class="fa fa-times fa-1x" ></span></button>
               </div>
           </div>
           <ul class="card-list">
               <% category.bookmarks.each do |bookmark| %>
               <li class="card-item">
               <a class="card-link" href="<%=bookmark.title%>" target="_black">
                   <img class="card-thumbnail" src="#" alt="#">
                   <p class="card-txt"><%=bookmark.title%></p>
               </a>
               </li>
               <% end %>
           </ul>
       </div>
       </div>
   <% end %>
  <div class="panel-add">
       <button class="addfolder js-add-panel">Add a folder</button>
       <div class="board-make js-panel-input" style="display:none">
           <input type="text" name="input" class="board-make-input js-panel-title" autocomplete="off" autocorrect="off" spellcheck="false" placeholder=" Add a folder">
           <input type="button" value="SAVE" class="save-button js-save-panel">
           <button class="delete-button js-delete-panel"><span class="fa fa-times fa-1x" aria-hidden="true"></span></button>
       </div>
   </div>
</div>
