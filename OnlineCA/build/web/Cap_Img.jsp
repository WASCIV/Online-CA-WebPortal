<%@ page import="java.io.*" 
%><%@ page import="java.awt.*"
%><%@ page import="java.awt.image.*"
%><%@ page import="javax.imageio.ImageIO"
%><%@ page import="java.util.*"
%><%
int width=75;
int height=35;
Random rdm=new Random();
int rl=rdm.nextInt();
String hash1 = Integer.toHexString(rl);
String capstr=hash1.substring(0,5); 
session.setAttribute("key",capstr);
Color background = new Color(0,0,200);
Color fbl = new Color(0,100,0);
Font fnt=new Font("SansSerif",1,21);
BufferedImage cpimg =new BufferedImage(width,height,BufferedImage.TYPE_INT_RGB);
Graphics g = cpimg.createGraphics();
g.setColor(Color.pink);
g.fillRect(0,0,width,height);
g.setColor(fbl);
g.setFont(fnt);
g.drawString(capstr,10,25);
g.setColor(Color.yellow);
g.drawLine(10,17,80,17);
g.drawLine(10,22,80,22);
response.setContentType("image/jpeg");
OutputStream strm = response.getOutputStream();
ImageIO.write(cpimg,"jpeg",strm);
strm.close();
%>
