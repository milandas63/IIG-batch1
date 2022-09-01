package io.stream;

public class Stretcher {
	public String stretch(String data, int length, char padWith, char side) {
		StringBuffer buf = new StringBuffer(data);
		for(int i=buf.length(); i<length; i++) {
			switch(side) {
			case 'L':
				buf.insert(0, padWith);
				break;
			case 'R':
				buf.append(padWith);
				break;
			case 'C':
				if(i%2==0) {
					buf.insert(0, padWith);
				} else {
					buf.append(padWith);
				}
				break;
			}
		}
		return buf.toString();
	}

	public String stretch(int data, int length, char padWith, char side) {
		String value = String.valueOf(data);
		String rValue = stretch(value, length, padWith, side);
		return rValue;
	}

	public String padL(int data, int length) {
		return stretch(data, length, ' ', 'L');
	}
	public String padL(int data, int length, char padWith) {
		return stretch(data, length, padWith, 'L');
	}
	public String padR(int data, int length) {
		return stretch(data, length, ' ', 'R');
	}
	public String padR(int data, int length, char padWith) {
		return stretch(data, length, padWith, 'R');
	}
	public String padC(int data, int length) {
		return stretch(data, length, ' ', 'C');
	}
	public String padC(int data, int length, char padWith) {
		return stretch(data, length, padWith, 'C');
	}

	
	public String padLeft(int data, int length) {
		return stretch(data, length, ' ', 'L');
	}
	public String padLeft(int data, int length, char padWith) {
		return stretch(data, length, padWith, 'L');
	}
	public String padRight(int data, int length) {
		return stretch(data, length, ' ', 'R');
	}
	public String padRight(int data, int length, char padWith) {
		return stretch(data, length, padWith, 'R');
	}
	public String padCenter(int data, int length) {
		return stretch(data, length, ' ', 'C');
	}
	public String padCenter(int data, int length, char padWith) {
		return stretch(data, length, padWith, 'C');
	}


	public String padL(String data, int length) {
		return stretch(data, length, ' ', 'L');
	}
	public String padL(String data, int length, char padWith) {
		return stretch(data, length, padWith, 'L');
	}
	public String padR(String data, int length) {
		return stretch(data, length, ' ', 'R');
	}
	public String padR(String data, int length, char padWith) {
		return stretch(data, length, padWith, 'R');
	}
	public String padC(String data, int length) {
		return stretch(data, length, ' ', 'C');
	}
	public String padC(String data, int length, char padWith) {
		return stretch(data, length, padWith, 'C');
	}

	public String padLeft(String data, int length) {
		return stretch(data, length, ' ', 'L');
	}
	public String padLeft(String data, int length, char padWith) {
		return stretch(data, length, padWith, 'L');
	}
	public String padRight(String data, int length) {
		return stretch(data, length, ' ', 'R');
	}
	public String padRight(String data, int length, char padWith) {
		return stretch(data, length, padWith, 'R');
	}
	public String padCenter(String data, int length) {
		return stretch(data, length, ' ', 'C');
	}
	public String padCenter(String data, int length, char padWith) {
		return stretch(data, length, padWith, 'C');
	}


	
	public String justifyLeft(String data, int length) {
		return stretch(data, length, ' ', 'R');
	}
	public String justifyLeft(String data, int length, char padWith) {
		return stretch(data, length, padWith, 'R');
	}
	public String justifyRight(String data, int length) {
		return stretch(data, length, ' ', 'L');
	}
	public String justifyRight(String data, int length, char padWith) {
		return stretch(data, length, padWith, 'L');
	}
	public String justifyCenter(String data, int length) {
		return stretch(data, length, ' ', 'C');
	}
	public String justifyCenter(String data, int length, char padWith) {
		return stretch(data, length, padWith, 'C');
	}


	public String justifyL(String data, int length) {
		return stretch(data, length, ' ', 'R');
	}
	public String justifyL(String data, int length, char padWith) {
		return stretch(data, length, padWith, 'R');
	}
	public String justifyR(String data, int length) {
		return stretch(data, length, ' ', 'L');
	}
	public String justifyR(String data, int length, char padWith) {
		return stretch(data, length, padWith, 'L');
	}
	public String justifyC(String data, int length) {
		return stretch(data, length, ' ', 'C');
	}
	public String justifyC(String data, int length, char padWith) {
		return stretch(data, length, padWith, 'C');
	}
}
