<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<STT.Models.Schedule>" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <link href="../../Content/Site.css" rel="Stylesheet" type="text/css" />
    <title>Index</title>
</head>
<body>
    <form id="form1" runat="server">
    <div align="center">
        <%  int row, col; %>
        <table class="tbl">
        <tr>
        <td></td>
        <td>ראשון</td>
        <td>שני</td>
        <td>שלישי</td>
        <td>רביעי</td>
        <td>חמישי</td>
        <td>שישי</td>
        </tr>
        <% for (row = 0;row < 14;row++) 
        { %> 
        <tr>
            <%for (col = 0; col < 7; col++)
              { %>
              <td dir=ltr>
                <%if (col == 0) Response.Write((row + 8) + ":00 - " + (row + 8) + ":45");
                  else Response.Write("None"); %>
              </td>
            <%} %>
        </tr>
        <% } %>
        </table>
    </div>
    </form>
</body>
</html>
