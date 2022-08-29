package tel.dir;

import java.awt.BorderLayout;
import java.awt.Font;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTextField;
import javax.swing.SwingConstants;

public class Start {
	JTextField tffName, tflname, tfLocation, tfMobile, tfEmail;
	
	public Start() {
		JFrame frame = new JFrame();
		frame.setLayout(new BorderLayout());
		frame.setIconImage(new ImageIcon("D:/IIG/Batch-1/tel.png").getImage());
			JPanel pnlWest = new JPanel(new GridLayout(9,1));
			frame.add(pnlWest, BorderLayout.WEST);
			JLabel fname = new JLabel("First Name: ", SwingConstants.RIGHT);
			JLabel lname = new JLabel("Last Name: ", SwingConstants.RIGHT);
			JLabel location = new JLabel("Location: ", SwingConstants.RIGHT);
			JLabel mobile = new JLabel("Mobile No.: ", SwingConstants.RIGHT);
			JLabel email = new JLabel("Email-id: ", SwingConstants.RIGHT);
			pnlWest.add(new JLabel());
			pnlWest.add(new JLabel());
			pnlWest.add(fname);
			pnlWest.add(lname);
			pnlWest.add(location);
			pnlWest.add(mobile);
			pnlWest.add(email);
			pnlWest.add(new JLabel());
			pnlWest.add(new JLabel());
			//
			JPanel pnlCenter = new JPanel(new GridLayout(9,1));
			frame.add(pnlCenter, BorderLayout.CENTER);
			tffName = new JTextField();
			tflname = new JTextField();
			tfLocation = new JTextField();
			tfMobile = new JTextField();
			tfEmail = new JTextField();
			pnlCenter.add(new JLabel());
			pnlCenter.add(new JLabel());
			pnlCenter.add(tffName);
			pnlCenter.add(tflname);
			pnlCenter.add(tfLocation);
			pnlCenter.add(tfMobile);
			pnlCenter.add(tfEmail);
			pnlCenter.add(new JLabel());
			pnlCenter.add(new JLabel());
		JLabel lblCaption = new JLabel("Telephone Directory", JLabel.CENTER);
		lblCaption.setFont(new Font("Arial",Font.BOLD, 24));
		frame.add(lblCaption, BorderLayout.NORTH);

		JPanel pnlSouth = new JPanel(new GridLayout(1,3));
		frame.add(pnlSouth, BorderLayout.SOUTH);
			JButton btnSave = new JButton("Save");
			JButton btnClear = new JButton("Clear");
			JButton btnExit = new JButton("Exit");
			btnSave.addActionListener(new ActionListener() {
				@Override
				public void actionPerformed(ActionEvent arg0) {
					System.out.println("Create CSV file");
				}
			});
			btnClear.addActionListener(new ActionListener() {
				@Override
				public void actionPerformed(ActionEvent arg0) {
					tffName.setText("");
					tflname.setText("");
					tfLocation.setText("");
					tfMobile.setText("");
					tfEmail.setText("");
					tffName.requestFocus();
				}
			});
			btnExit.addActionListener(new ExitClass());
				pnlSouth.add(btnSave);
				pnlSouth.add(btnClear);
				pnlSouth.add(btnExit);
			
		frame.setBounds(700, 100, 500, 350);
		frame.setVisible(true);
	}

	public static void main(String[] args) {
		new Start();
	}

}
