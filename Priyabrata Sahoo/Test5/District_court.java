package ourjudisialsystem;

public class District_court implements Judiciary {
	public int getJudgementFavour;
	public int getNumberOfCaseSittings;
	public int getNumberOfWitnesses;
	String cuttack;
	public int getNumberOfWitnesse;


	@Override
	public String getCourtName() {
		
		return "Cuttack" ;
	}

	@Override
	public boolean getJudgementFavour(int party) {
		this.getJudgementFavour=2;
		return false;
	}

	@Override
	public int getNumberOfCaseSittings()  {
		this.getNumberOfCaseSittings=11;
		return getNumberOfCaseSittings;
	}

	@Override
	public int getNumberOfWitnesses() {
		this.getNumberOfWitnesse=3;
		return getNumberOfWitnesse;
	}

	public static void main(String[] args) {
		

	}

}
