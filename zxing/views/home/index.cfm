<h1>Welcome to my QR Code Generator!</h1>
<cfoutput>
<div id="content">
<br/>
<form action="#event.BuildLink(linkto='#event.getCurrentModule()#.home.index')#" method="post" class="form">
		<p>
			<label for="messageType">Please choose the Message type:</label>
			<select name="messageType" id="messageType">
			    
				<option value="URI" <cfif event.getValue('messageType') eq 'URI'>selected="selected"</cfif>>URI</option>
				<option value="phone" <cfif event.getValue('messageType') eq 'phone'>selected="selected"</cfif>>Telephone Number</option>
				<option value="email" <cfif event.getValue('messageType') eq 'email'>selected="selected"</cfif>>Email Address</option>
				<option value="Other" <cfif event.getValue('messageType') eq 'Other'>selected="selected"</cfif>>Generic Text</option>
			</select>
		</p>
		<p>
			<label for="contents">Your message ( <a href="http://code.google.com/p/zxing/wiki/BarcodeContents">Bar Code contents</a> formats.):</label>
<br/>
			<textarea name="contents" id="contents" cols="65" rows="5">#event.getValue('contents','')#</textarea>
		</p>
		<p>
			<label for="width">Width:</label>
			<input type="text" name="width" id="width" value="#event.getValue('width','160')#" size="4"/>
		</p>
		<p>
			<label for="height">Height:</label>
			<input type="text" name="height" id="height" value="#event.getValue('height','160')#" size="4"/>
		</p>		
		<p>
			<input type="submit" value="Generate QR Codes" class="submit">
		</p>
</form>
</div>


<cfif event.valueExists(name='qrimageCode',private=true) and isimage(prc.qrimagecode)>
	<div id="QRCodeImage">
		<h2>QR Code Image:</h2>
		<cfimage action="writeToBrowser" source="#prc.qrimageCode#" format="png"> 
	</div>
</cfif>
</cfoutput>