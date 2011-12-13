<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<STT.Models.Schedule>" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Index</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Table runat="server" ID="myTable" Height="120px" Width="195px" GridLines="horizontal" HorizontalAlign="Center"  BorderWidth="5" BorderColor = "Black">
            <asp:TableRow ID="TblRow1" runat="server" >
                <asp:TableCell   BorderWidth="2" HorizontalAlign=Center ID="TblCell1" runat="server">Cell 1</asp:TableCell>
                <asp:TableCell BorderWidth="2" HorizontalAlign=Center ID="TableCell3" runat="server">Cell 2</asp:TableCell>
            </asp:TableRow>
            <asp:TableRow ID="TableRow2" runat="server" >
                <asp:TableCell BorderWidth="2" HorizontalAlign=Center ID="TableCell2" runat="server">Cell 3</asp:TableCell>
                   <asp:TableCell BorderWidth="2" HorizontalAlign=Center ID="TableCell4" runat="server">Cell 4</asp:TableCell>
            </asp:TableRow>
        </asp:Table>
    </div>
    </form>
</body>
</html>
