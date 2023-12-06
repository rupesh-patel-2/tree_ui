


(function() {
    
    window.setTimeout(()=>{    
      siteMapStore.attachHandler(function(data) {
       
         document.getElementById(data.page_id).innerHTML = '<h1>Hello world!!</h1>'+document.getElementById(data.page_id).innerHTML;
      },'page_clicked')
        
        
    
    },2000)

 })();