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

    <!--Variabels:-->
    <%  string cells="tbl";
        string date = String.Format("{0:dd/MM/yyyy}", DateTime.Today);
      
        
    %>

    <!--Title:-->
    <table width=100%>
        <tr>
            <td width=33%>
            </td>
            <td align="center" width=33%>
                <span class="stt">Student Time Table</span>
                <br />
                <br />
                <!--Student details:-->
                <table class="tbl_student_details">
                    <tr>
                        <td>שם הסטודנט:</td>
                        <td><%=Model.Student_Name %></td>
                        <td>ת.ז:</td>
                        <td><%=Model.Student_ID %></td>
                        <td>תאריך:</td>
                        <td><%=date %></td>
                    </tr>
                </table>
            </td>
            <td align=left width=33%>
                <asp:Image ID="stt" ImageUrl="..\..\Images\STT_logo.png" runat="server" Height="100px"/> 
            </td>
        </tr>
    </table>
    <br />

    <!--Schedule:-->
        <%  int row, col;
            String message_content;    
        %>
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

        <% for (row = Model.start_time; row <= Model.end_time; row++) 
        { %> 
            <tr>
                <%for (col = -1; col < 6; col++)
                  { 
                    if (col == -1)
                      {%>
                        <td dir="ltr" class="time_col">
                            <%Response.Write((row + 8) + ":00 - " + (row + 8) + ":45");%>
                        </td>
                    <%}

                      else if (Model.int_table[row][col] != -1)
                      { %>
                        <td rowspan="<%=Model.int_table[row][col]%>" dir="ltr">   
                            <!--Cells-->
                            <%if (Model.int_table[row][col] != 0)
                              { %> 
                                <!--Course details-->
                                <table class="tbl_courses">
                                    <tr><td colspan="2"><% Response.Write(Model.c_table[row][col].Name + " - ");
                                            if (Model.c_table[row][col].is_lecture) Response.Write("הרצאה"); else Response.Write("תרגול");%>
                                    </td></tr>
                                    <tr><td colspan=2><%=Model.c_table[row][col].Lecturer%></td></tr>
                                    <tr><td><%=Model.c_table[row][col].Class_Room%></td><td>כיתה</td></tr>
                                </table>

                                <!--Button-->
                                <%if ((Model.c_table[row][col]._message) != null) {
                                      message_content = Model.c_table[row][col]._message.getSubject() + ":\n\n" + Model.c_table[row][col]._message.getContent().Replace("\\n", "\n");
                                      ImageButton1.ToolTip = message_content;
                                      %>
                                    <asp:ImageButton ID="ImageButton1" ImageUrl="..\..\Images\Message.png" Width="20px" runat="server"/> <%} %>

                                <!--<asp:ImageButton ID="ImageButton2" ImageUrl="..\..\Images\exam.png" Width="33px" runat="server" />-->

                                 <%if ((Model.c_table[row][col]._exercise.getId()) != -1 && Model.c_table[row][col].is_lecture == false) {
                                       message_content = Model.c_table[row][col]._exercise.getSubject() + ":\n\n" + Model.c_table[row][col]._exercise.getContent().Replace("\\n", "\n");
                                       ImageButton4.ToolTip = message_content;
                                       %>
                                    <asp:ImageButton ID="ImageButton4" ImageUrl="..\..\Images\exercise.png" Width="20px" runat="server" /> <%}
                                                                                                                                               ImageButton3.OnClientClick = "window.open('mailto:" + Model.c_table[row][col].email + "','email');";
                                  %>
                                <asp:ImageButton ID="ImageButton3" ImageUrl="..\..\Images\contact.png" Width="20px" runat="server" />
                            <%}
                              else Response.Write("&nbsp;");%>
                        </td>
                    <%}   
                }%>
                </tr>
        <% } %>
        </table>
    </div>
    </form>
</body>
</html>