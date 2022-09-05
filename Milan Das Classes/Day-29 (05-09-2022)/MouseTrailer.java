package tel.dir;

import java.awt.Graphics;
import java.awt.event.MouseEvent;
import java.awt.event.MouseMotionListener;

import javax.swing.JFrame;

public class MouseTrailer extends JFrame implements MouseMotionListener {
	Graphics g;
	
	public MouseTrailer() {
		super("Mouse Location Trailer");
		
		this.addMouseMotionListener(this);
		this.setBounds(100,100,1000,600);
		this.setVisible(true);
	}
	
	@Override
	public void mouseDragged(MouseEvent arg0) {
	}

	@Override
	public void mouseMoved(MouseEvent e) {
		int x = e.getX();
		int y = e.getY();
		g = this.getGraphics();
		this.paint(g);
		g.drawString("("+x+","+y+")", x, y);
	}

	public static void main(String[] args) {
		new MouseTrailer();
	}

}
