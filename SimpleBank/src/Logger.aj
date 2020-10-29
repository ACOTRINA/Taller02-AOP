import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;


public aspect Logger {
	
	pointcut successA() : call(* create*(..) );
    after() : successA() { 
    	System.out.println("**** User created ****");
    }
    
    File file = new File("log.txt");
    Calendar cal = Calendar.getInstance();
    pointcut successB() : call(* create*(..) );
    after() : successB() {
    	System.out.println("**** User created ****");
    }
	
    pointcut successT() : call(* moneyMakeTransaction*(..) );    
    after() : successT() {
    	try(BufferedWriter bw = new BufferedWriter(new FileWriter(new File("log.txt"),true))){
    		SimpleDateFormat dateFormat  = new SimpleDateFormat("HH:mm:ss");
    		Date date = new Date();    		
    		bw.append("transaccion: "+dateFormat.format(date));
    		System.out.println("Transaction: "+dateFormat.format(date));    		
    		bw.newLine();
    		}catch(Exception e){
    			System.out.println("Exception: "+e);
    		}        
    	System.out.println("**** Transaction created ****");
    }
    
    pointcut successR() : call(* moneyWithdrawal*(..) );    
    after() : successR() {
    	try(BufferedWriter bw = new BufferedWriter(new FileWriter(new File("log.txt"),true))){
    		SimpleDateFormat dateFormat  = new SimpleDateFormat("HH:mm:ss");
    		Date date = new Date();    		
    		bw.append("Withdrawal: "+dateFormat.format(date));
    		System.out.println("Withdrawal: "+dateFormat.format(date));    		
    		bw.newLine();
    		}catch(Exception e){
    			System.out.println("Exception: "+e);
    		}        
    	System.out.println("**** Withdrawal created ****");
    }
    
}

