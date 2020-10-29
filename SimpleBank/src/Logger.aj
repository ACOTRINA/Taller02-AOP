import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.util.Calendar;

public aspect Logger {

	pointcut successTr() : call(* moneyMakeTransaction*(..) );  
    after() : successTr() {
    	try(BufferedWriter file = new BufferedWriter(new FileWriter(new File("log.txt"),true))){
    		Calendar cal = Calendar.getInstance();  	
    		file.append("Transaction "+cal.get(Calendar.HOUR_OF_DAY)+":"+cal.get(Calendar.MINUTE)+":"+cal.get(Calendar.SECOND));
    		System.out.println("Transaction "+cal.get(Calendar.HOUR_OF_DAY)+":"+cal.get(Calendar.MINUTE)+":"+cal.get(Calendar.SECOND)); 
    		file.newLine();
    		}catch(Exception e){
    			System.out.println("Exception: "+e);
    		}        
    	System.out.println("**** Transaction processed ****");
    }
    
    pointcut successWd() : call(* moneyWithdrawal*(..) );    
    after() : successWd() {
    	try(BufferedWriter file = new BufferedWriter(new FileWriter(new File("log.txt"),true))){
    		Calendar cal = Calendar.getInstance();  	
    		file.append("Withdrawal "+cal.get(Calendar.HOUR_OF_DAY)+":"+cal.get(Calendar.MINUTE)+":"+cal.get(Calendar.SECOND));
    		System.out.println("Withdrawal "+cal.get(Calendar.HOUR_OF_DAY)+":"+cal.get(Calendar.MINUTE)+":"+cal.get(Calendar.SECOND)); 
    		file.newLine();
    		}catch(Exception e){
    			System.out.println("Exception: "+e);
    		}        
    	System.out.println("**** Withdrawal processed ****");
    }
    
    pointcut success() : call(* create*(..) );
    after() : success() {
    	System.out.println("**** User created ****");
    }

    


}
