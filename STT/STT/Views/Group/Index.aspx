<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<STT.Models.Schedule>" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <link href="../../Content/Site.css" rel="Stylesheet" type="text/css" />
    <title>Student Time Table</title>
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
    <span class="style1"><strong>Student Time Table</strong></span>

    <!--Variabels:-->
    <%  string cells;
        string date = String.Format("{0:dd/MM/yyyy}", DateTime.Today);
      
        
    %>

    <!--Title:-->
    <asp:Image ID="stt" ImageUrl="..\..\Images\STT_logo.png" runat="server" Height="48px" Width="152px" />   
    <br />
    <br />

    <!--Student details:-->
    <table class="tbl_student_details">
    <tr>
    <td>שם הסטודנט:</td>
    <td><%=Model.Student_Name %></td>
    <td>ת.ז:</td>
    <td><%=Model.Student_ID %></td>
<!--    <td>חוג:</td>
    <td></td>   -->
    <td>תאריך:</td>
    <td><%=date %></td>
    </tr>
    </table>
    <br />


    <!--Schedule:-->
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
            <%for (col = -1; col < 6; col++)
              { %>
              <%if (row % 2 == 0)
                    cells = "tbl_cells_even";
                else
                    cells = "tbl_cells_odd";
                    %>
                <td dir="ltr" class="<%=cells%>">
                    <%if (col == -1) Response.Write((row + 8) + ":00 - " + (row + 8) + ":45");
                      else
                      {%>
                        
                        <!--Cells-->
                        <%if (Model.int_table[row][col] == 1)
                          { %>
                            
                            <!--Course details-->
                            <table class="tbl_courses">
                                <tr><td><%=Model.c_table[row][col].Name%></td><td>הרצאה</td></tr>
                                <tr><td></td><td><%=Model.c_table[row][col].Lecturer%></td></tr>
                                <tr><td><%=Model.c_table[row][col].Class_Room%></td><td>כיתה</td></tr>
                            </table>

                            <!--Button-->
                            <asp:ImageButton ID="ImageButton1" ImageUrl="..\..\Images\Message.png" Width="20px" runat="server" />
                            <asp:ImageButton ID="ImageButton2" ImageUrl="..\..\Images\exam.png" Width="33px" runat="server" />
                            <asp:ImageButton ID="ImageButton4" ImageUrl="..\..\Images\exercise.png" Width="20px" runat="server" />
                            <asp:ImageButton ID="ImageButton3" ImageUrl="..\..\Images\contact.png" Width="20px" runat="server" />
                        <%}
                          else Response.Write("&nbsp;");  
                          %>
                    <%} %>
                </td>
                <%} %>
        </tr>
        <% } %>
        </table>
    </div>
    </form>
</body>
</html>