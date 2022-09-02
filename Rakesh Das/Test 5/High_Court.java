package civil_court;

public class High_Court implements Judiciary{
	public String court_name;
	public int judgement_favour;
	public int no_of_sittings;
	public int no_of_witness;

	@Override
	public String getCourtName() {
		return "High_Court";
	}

	@Override
	public int getJudgementFavour() {
		this.judgement_favour = 1;
		return this.judgement_favour;
	}

	@Override
	public int getNumberOfCaseSittings() {
		this.no_of_sittings = 8;
		return this.no_of_sittings;
	}

	@Override
	public int getNumberOfWitnesses() {
		this.no_of_witness = 6;
		return this.no_of_witness;
	}

}
