/**
* A normal ColdBox Event Handler
*/
component{
	property name="QRCodeWriter" inject="coldbox:myplugin:QRCodeGenerator@zxing" scope="instance";
	
	function index(event){
	    var rc = event.getCollection();
		var prc = event.getCollection(private=true);
		event.paramvalue('messageType','URI');
		event.paramvalue('width',160);
		event.paramvalue('height',160);
		
	     if (event.valueexists('contents') and len(rc.contents)){
		 	switch(rc.messageType){
				case 'phone':
					if (findnocase(rc.contents,'tel:+') neq 1)
						rc.contents = 'tel:+' & rc.contents;			
				break;
				case 'email':
					if (findnocase(rc.contents,'mailto:') neq 1)
						rc.contents = 'mailto:' & rc.contents;				
				break;
				case 'URI': //URI
					if (findnocase(rc.contents,'http://') neq 1)
						rc.contents = 'http://' & rc.contents;
				break;
			}
		 	prc.qrimageCode = instance.QRCodeWriter.getQRCodeImage(contents=rc.contents, width=rc.width, height=rc.height);
		 }	 
		 event.setView("home/index");
	}

}

