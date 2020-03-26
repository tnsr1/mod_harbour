function Main()

   if ! File( hb_GetEnv( "PRGPATH" ) + "/chat.dbf" )
      DbCreate( hb_GetEnv( "PRGPATH" ) + "/chat.dbf",;
                { { "TIME",        "C",  8, 0 },;
                  { "USERID",      "C", 15, 0 },;
                  { "MSG",         "M", 10, 0 } } )
   endif   
   
   USE ( hb_GetEnv( "PRGPATH" ) + "/chat" ) SHARED NEW   
   
   BeginPage()
   
   ?? "<div class='browse' id='browse'>"
   while ! EOF()
      DispRecord()
      SKIP
   end   
   if AP_Method() == "POST"
      APPEND BLANK
      if RLock()
         Field->Time   := Left( Time(), 5 )
         Field->UserId := "Test"
         Field->Msg    := hb_UrlDecode( AP_PostPairs()[ "msg" ] ) 
         DbUnLock()
      endif         
      DispRecord()
   endif   
   ?? "</div>"
   
   TEMPLATE
      <form action="chat.prg" method="post">
         <br><br><input type="text" id="msg" name="msg" size="90">
         <button type="submit">Send</button>
      </form>
      <script>scrollToBottom( "browse" );</script>
   ENDTEXT
   
   EndPage()
   
   USE
   
return nil   

function BeginPage()

   TEMPLATE
      <html>
      <head>
         <meta http-equiv="refresh" content="5"/>
         <meta charset="UTF-8">
      </head>
      <style>
         .browse {
            overflow-y: scroll;
            width: 700px;
            height: 600px;
            background-color:white;
          }
          .record {
             width:700px;
          }
          .record:hover {
             background-color: rgb(248,248,248);
          }
      </style>
      <script>
         function scrollToBottom( id )
         {
            var div = document.getElementById( id );
            div.scrollTop = div.scrollHeight - div.clientHeight;
         }
     </script>    
     <body style='background-color:purple;'>
   ENDTEXT

return nil

function DispRecord()

   ?? "<div class='record'>"
   ?? "<img src='https://ca.slack-edge.com/TJH5YU202-UNAHBRTFA-g3d2a3f4c28c-48' width=40 height=40>"
   ?? "<a><b>" + AllTrim( Field->UserId ) + "</b></a>"
   ?? "<a>"+ Field->Time + "</a><br>"
   ?? "<a style='padding-left:50px;'>" + AllTrim( Field->Msg ) + "</a>"
   ?? "</div>"

return nil

function EndPage()

   ?? "</body>"
   ?? "</html>"
   
return nil   