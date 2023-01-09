import java.awt.EventQueue;
import javax.swing.JFrame;
import javax.swing.JButton;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;
import javax.swing.JTextField;
import javax.swing.JLabel;
import javax.swing.JTextArea;
public class MainWindow {
private JFrame frmWriteInWords;
private JTextField txtinp;

public static void main(String[] args) {
EventQueue.invokeLater(new Runnable() {
public void run() {
try {
MainWindow window = new MainWindow();
window.frmWriteInWords.setVisible(true);
} catch (Exception e) {
e.printStackTrace();
}
}
});
}

public MainWindow() {
initialize();
}

private static String intToString(long inp) {
String rs=new String("");
long tmp1, tmp2;
int i;
tmp2 = inp;
for(i=0; tmp2>0; i++) {
tmp1 = i==1 ? tmp2%10 : tmp2%100;
if(i>=4)
return rs=(tmp2==0?"":intToString(tmp2))+(tmp2==0?"":placeGroup(i))+rs;
else
rs=(tmp1==0?"":dig2Word(tmp1))+(tmp1==0?"":placeGroup(i))+rs;
tmp2 = i==1 ? tmp2/10 : tmp2/100;
}
return rs;
}
private static String dig2Word(long inp) {
String rs = new String();
inp %= 100;
if(inp==0)
rs="Zero ";
else if(inp>=90)
rs="Ninety ";
else if(inp>=80)
rs="Eighty ";
else if(inp>=70)
rs="Seventy ";
else if(inp>=60)
rs="Sixty ";
else if(inp>=50)
rs="Fifty ";
else if(inp>=40)
rs="Forty ";
else if(inp>=30)
rs="Thirty ";
else if(inp>=20)
rs="Twenty ";
else if(inp>=10) {
switch((int)inp) {
case 10:
rs+="Ten ";
break;
case 11:
rs+="Eleven ";
break;
case 12:
rs+="Twelve ";
break;
case 13:
rs+="Thirteen ";
break;
case 14:
rs+="Fourteen ";
break;
case 15:
rs+="Fifteen ";
break;
case 16:
rs+="Sixteen ";
break;
case 17:
rs+="Seventeen ";
break;
case 18:
rs+="Eighteen ";
break;
case 19:
rs+="Nineteen";
break;
}
return rs;
}
if(inp%10!=0) {
switch((int)inp%10) {
case 1:
rs+="One ";
break;
case 2:
rs+="Two ";
break;
case 3:
rs+="Three ";
break;
case 4:
rs+="Four ";
break;
case 5:
rs+="Five ";
break;
case 6:
rs+="Six ";
break;
case 7:
rs+="Seven ";
break;
case 8:
rs+="Eight ";
break;
case 9:
rs+="Nine ";
break;
}
}
return rs;
}
private static String placeGroup(long pos) {
String rs= new String();
;
switch((int)pos) {
case 0:
rs=" ";
break;
case 1:
rs="Hundred ";
break;
case 2:
rs="Thousand ";
break;
case 3:
rs="Lac ";
break;
case 4:
rs="Crore ";
break;
default:
rs="";
}
return rs;
}
private void initialize() {
frmWriteInWords = new JFrame();
frmWriteInWords.setTitle("Write in Words");
frmWriteInWords.setBounds(100, 100, 349, 225);
frmWriteInWords.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
frmWriteInWords.getContentPane().setLayout(null);
txtinp = new JTextField();
txtinp.setBounds(10, 32, 203, 20);
frmWriteInWords.getContentPane().add(txtinp);
txtinp.setColumns(10);
JTextArea textArea = new JTextArea();
textArea.setEditable(false);
textArea.setLineWrap(true);
textArea.setWrapStyleWord(true);
textArea.setRows(3);
textArea.setBounds(10, 75, 302, 79);
frmWriteInWords.getContentPane().add(textArea);
JButton btncnvrt = new JButton("In Words");
btncnvrt.addActionListener(new ActionListener() {
public void actionPerformed(ActionEvent arg0) {
textArea.setText(intToString(Integer.parseInt(txtinp.getText())));
}
});
btncnvrt.setBounds(223, 31, 89, 23);
frmWriteInWords.getContentPane().add(btncnvrt);
JLabel lblNewLabel = new JLabel("A Simple GUI Program by Sikun");
lblNewLabel.setBounds(109, 165, 203, 14);
frmWriteInWords.getContentPane().add(lblNewLabel);
}
}