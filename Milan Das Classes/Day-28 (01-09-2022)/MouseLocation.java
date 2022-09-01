package tel.dir;

import java.awt.BorderLayout;
import java.awt.GridLayout;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;

import javax.swing.ImageIcon;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;

public class MouseLocation extends JFrame implements MouseListener {
	JLabel lblX;
	JLabel lblY;
	
	public MouseLocation() {
		super("Mouse Location Detection");
		//this.setTitle("Mouse Location Detector");
		this.setLayout(new BorderLayout());
		
		JPanel pnlSouth = new JPanel(new GridLayout(1,2));
		this.add(pnlSouth, BorderLayout.SOUTH);
		lblX = new JLabel("", JLabel.CENTER);
		lblY = new JLabel("", JLabel.CENTER);
		pnlSouth.add(lblX);
		pnlSouth.add(lblY);
		
		this.addMouseListener(this);
		this.setIconImage(new ImageIcon("D:/IIG/Batch-1/tel.png").getImage());
		this.setBounds(400, 100, 700, 550);
		this.setVisible(true);

	}

	public static void main(String[] args) {
		new MouseLocation();
	}

	@Override
	public void mouseClicked(MouseEvent e) {
		int x = e.getX();
		int y = e.getY();
		lblX.setText(String.valueOf(x));
		lblY.setText(String.valueOf(y));
	}

	@Override
	public void mouseEntered(MouseEvent e) {
		
	}

	@Override
	public void mouseExited(MouseEvent e) {
		
	}

	@Override
	public void mousePressed(MouseEvent e) {
		
	}

	@Override
	public void mouseReleased(MouseEvent e) {
		
	}

}
