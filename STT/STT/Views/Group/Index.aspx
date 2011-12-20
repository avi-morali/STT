<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<STT.Models.Schedule>" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <link href="../../Content/Site.css" rel="Stylesheet" type="text/css" />
    <title>Index</title>
    <style type="text/css">
        .style1
        {
            font-size: x-large;
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">
    <div align="center">
    <span class="style1"><strong>Student Time Table</strong>
    <asp:Image ID="stt" ImageUrl="..\..\Images\STT_logo.png" runat="server" Height="48px" Width="152px" />
        </span>
    <br />
    <br />
    <asp:TextBox ID="TextBox1"  runat="server" style="font-weight: 700">
    שם הסטודנט:
    </asp:TextBox>
    <asp:TextBox ID="TextBox2"  runat="server" style="font-weight: 700">
    ת.ז:
    </asp:TextBox>
    <asp:TextBox ID="TextBox3"  runat="server" style="font-weight: 700">
    חוג:
    </asp:TextBox>
    <asp:TextBox ID="TextBox4"  runat="server" style="font-weight: 700">
    תאריך:
    </asp:TextBox>  
    <br />
    <br />

        <%  int row, col; %>
        <table class="tbl">
        <tr class="headline_table">
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
              <%if (row % 2 == 0)
                { %>
                <td dir=ltr class="tbl_cells_even">
                    <%if (col == 0) Response.Write((row + 8) + ":00 - " + (row + 8) + ":45"); 
                        else Response.Write(" "); %>
                </td>
                <%}
                else
                {%>
                 <td dir=ltr class="tbl_cells_odd">
                    <%if (col == 0) Response.Write((row + 8) + ":00 - " + (row + 8) + ":45"); 
                        else Response.Write(" "); %>
                </td>
                <%} %>
            <%} %>
        </tr>
        <% } %>
        </table>
    </div>
    </form>
</body>
</html>
