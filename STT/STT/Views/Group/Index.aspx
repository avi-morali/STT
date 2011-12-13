<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<STT.Models.Schedule>" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Index</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Table runat="server" ID="myTable" Height="120px" Width="195px"  BorderWidth="5" BorderColor = "#000000">

            <asp:TableRow ID="TblRow1" runat="server" >

                <asp:TableCell ID="TblCell1" runat="server"></asp:TableCell>
                <asp:TableCell ID="TableCell1" runat="server"></asp:TableCell>


            </asp:TableRow>
        </asp:Table>
    </div>
    </form>
</body>
</html>
