<%@ page import ="java.sql.*" %>
<%@ page import ="java.security.*" %>
<%@ page import ="java.math.*" %>

<%
if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
%>
You are not logged in<br/>
<a href="index.html">Please Login</a>
<%}
String orderID = (String)request.getAttribute("orderid");

String text = "AMOUNT=980weliveinnumber76CURRENCY=EURweliveinnumber76LANGUAGE=en_USweliveinnumber76ORDERID="+ orderID +"weliveinnumber76PSPID=zenduweliveinnumber76";

text = text + "TITLE=PAYMENTweliveinnumber76";

MessageDigest crypt = MessageDigest.getInstance("SHA-1");
crypt.reset();
crypt.update(text.getBytes("UTF-8"));

String result = new BigInteger(1, crypt.digest()).toString(16);
%>

<html>
<p>Payment <%= result %></p>
<FORM METHOD="post" ACTION="https://secure.ogone.com/ncol/test/orderstandard.asp" id=form1 name=form1>
<INPUT NAME="PSPID" value="zendu">
<INPUT NAME="orderID" VALUE="<%=orderID%>">
<INPUT NAME="amount" VALUE="980">
<INPUT NAME="currency" VALUE="EUR">
<INPUT NAME="language" VALUE="en_US">
<!-- lay out information -->

<!--<INPUT type="hidden" NAME="MANDATEID" VALUE="">
<INPUT type="hidden" NAME="SIGNDATE" VALUE="">
<INPUT type="hidden" NAME="SEQUENCETYPE" VALUE="">-->

<INPUT type="hidden" NAME="TITLE" VALUE="PAYMENT">
<!--<INPUT type="hidden" NAME="TXTCOLOR" VALUE="#FFFFFF">
<INPUT type="hidden" NAME="TBLBGCOLOR" VALUE="#FFFFFF">
<INPUT type="hidden" NAME="TBLTXTCOLOR" VALUE="#000000">
<INPUT type="hidden" NAME="BUTTONBGCOLOR" VALUE="#00467F">
<INPUT type="hidden" NAME="BUTTONTXTCOLOR" VALUE="#FFFFFF">
<INPUT type="hidden" NAME="LOGO" VALUE="<fill here your logo file name>">
<INPUT type="hidden" NAME="FONTTYPE" VALUE="Verdana">-->

<INPUT type="hidden" NAME="SHASIGN" VALUE="<%= result %>">
<!-- or dynamic template page
<INPUT type="hidden" NAME="TP" VALUE="<fill here your template page>">

<INPUT type="hidden" NAME="ACCEPTURL" VALUE="">
<INPUT type="hidden" NAME="declineurl" VALUE="">
<INPUT type="hidden" NAME="exceptionurl" VALUE="">
<INPUT type="hidden" NAME="cancelurl" VALUE="">

<INPUT type="hidden" NAME="COM" VALUE="<fill here your order description>">
<INPUT type="hidden" NAME="CN" VALUE="<fill here your Client name>">
<INPUT type="hidden" name="EMAIL" value="<fill here your Client email>">
<INPUT type="hidden" NAME="PM" VALUE="">
<INPUT type="hidden" NAME="BRAND" VALUE="">
<INPUT type="hidden" NAME="ownerZIP" VALUE="">
<INPUT type="hidden" NAME="owneraddress" VALUE="">
<INPUT type="hidden" NAME="owneraddress2" VALUE="">
<INPUT type="hidden" NAME="owneraddress3" VALUE="">-->
<input type="submit" value="SUBMIT" id=submit2 name=submit2>
</form>
</html>
