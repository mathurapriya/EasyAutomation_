package FunctionLibrary;

import java.io.IOException;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;

/*import java.net.MalformedURLException;
import java.net.URL;

import org.openqa.selenium.remote.DesiredCapabilities;
import org.openqa.selenium.remote.RemoteWebDriver;*/

public class Test {
	
	public void testing(String testdata){
		System.out.println("testdata" + testdata);
		   try {
			Process process = Runtime.getRuntime().exec("notepad.exe");
			//mainflow();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	
	public void mainflow(String link){
		WebDriver browser = null;
		// System.setProperty("webdriver.chrome.driver", System.getProperty("user.dir")  + File.separator + "resources" + File.separator + "chromedriver.exe");
		System.setProperty("webdriver.chrome.driver", "E:\\M.Tech. Dissertation\\downloads\\seleniumjars\\chromedriver.exe");
		browser = new ChromeDriver();
		browser.get(link); 
		
		/*try {
			RemoteWebDriver driver = new RemoteWebDriver(new URL("http://remoteHostIP:remoteHostPort/wd/hub"), DesiredCapabilities.chrome());
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		*/
	}


}
