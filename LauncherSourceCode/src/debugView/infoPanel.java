package debugView;

import java.awt.Dimension;

import javax.swing.JPanel;
import javax.swing.BoxLayout;
import javax.swing.JLabel;
import javax.swing.JProgressBar;
import javax.swing.border.EtchedBorder;

/**
 * Project 1: Group robotic behaviour simulation using Robot Operating System (ROS) 
 * Group 1: UGBots
 * 
 * Members: Andy Choi, Kevin Choi, Andrew Jeoung, Jay Kim, Jenny Lee, Namjun Park, Harvey Rendell, Chuan-Yu Wu
 * 
 * This class is responsible for creating a JPanel which displays basic information
 * for the robot it corresponds to
 */
@SuppressWarnings("serial")
public class infoPanel extends JPanel {

	/**
	 * Create the panel.
	 */
	
	//Labels saved as fields for getting and setting
	private JLabel _title = new JLabel();
	private JLabel _type = new JLabel();
	private JLabel _xPos = new JLabel("x position: ");
	private JLabel _yPos = new JLabel("y position: ");
	private JLabel _status = new JLabel("status: ");
	private JLabel _message = new JLabel("message: ");
	private JPanel _progressWrapper = new JPanel();
	private JProgressBar _binProgress = new JProgressBar();
	
	public infoPanel(String title, String type) {
		
		setLayout(new BoxLayout(this, BoxLayout.Y_AXIS));
		_title.setText(title);
		_type.setText(type);
		
		//adding the labels when panel is created
		addPanels();
		
		this.setBorder(new EtchedBorder(EtchedBorder.LOWERED));
	}
	
	private void addPanels(){
		this.add(_title);
		this.add(_type);
		this.add(_xPos);
		this.add(_yPos);
		this.add(_status);
		this.add(_message);
		//Add progress bar to show the bins status
		if (_type.getText().contains("Picker")){
			JLabel binLabel = new JLabel("Bin:");
			_binProgress.setMaximumSize(new Dimension(100,15));
			_binProgress.setMaximum(100);
			_binProgress.setMinimum(0);
			
			_progressWrapper.add(binLabel);
			_progressWrapper.add(_binProgress);
			
			this.add(_progressWrapper);
		}
	}
	
//Getters and setters to change the information in the label
	public String getXPos(){return _xPos.getText();}
	public void setXPos(String info){_xPos.setText(info);}
	
	public String getYPos(){return _yPos.getText();}
	public void setYPos(String info){_yPos.setText(info);}
	
	public String getStatus(){return _status.getText();}
	public void setStatus(String info){_status.setText(info);}
	
	public String getMessage(){return _message.getText();}
	public void setMessage(String info){ _message.setText(info);}
	
	public int getBinProg(){return _binProgress.getValue();}
	public void setBinProg(String info){
			_binProgress.setValue(Integer.parseInt(info));
	}
}
