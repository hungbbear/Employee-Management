<%-- 
    Document   : layout_chooser
    Created on : Jun 30, 2017, 9:28:58 AM
    Author     : Hung
--%>

<%
    String view=request.getParameter("view");
    if(view.startsWith("member/")){
        if(view.startsWith("member/login")||view.startsWith("member/new"))
            pageContext.forward("layout.jsp");
        else
            pageContext.forward("layoutmember.jsp");
    }
    else{
        pageContext.forward("layoutmember.jsp");
    }
%>