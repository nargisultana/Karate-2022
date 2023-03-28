package features;

import com.intuit.karate.junit5.Karate;

public class KarateRunner {
	
	@Karate.Test
	public Karate test () {
		return Karate
				.run("unitTest.feature")
				.tags("@helper")
				.relativeTo(getClass());
	}

}
