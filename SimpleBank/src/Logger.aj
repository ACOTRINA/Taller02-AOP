import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

public aspect Logger {
    
	pointcut success1() : call(* *.createUser() );
    after() : success1() {
    //Aspecto ejemplo: solo muestra este mensaje después de haber creado un usuario 
    	System.out.println("**** User created ****");
    }
    pointcut tramite() : call(* *.money*() );
    after() : tramite() {
    	try(
    			BufferedWriter bw = new BufferedWriter(new FileWriter(new File("log.txt"),true)))
    		{
    			SimpleDateFormat dateFormat  = new SimpleDateFormat("HH:mm:ss");
    			Date fecha = new Date();  
    			if(thisJoinPoint.getSignature().getName().startsWith("moneyW")) {
    				bw.write("Retiro realizado a las: "+dateFormat.format(fecha));
    				System.out.println("\n Withdrawal  "+dateFormat.format(fecha));
    				System.out.println("**** Withdrawal created ****");
    			}else if(thisJoinPoint.getSignature().getName().startsWith("moneyM")) {
    				bw.write("Transacción realizada a las: "+dateFormat.format(fecha));
    				System.out.println("\n Transaction  "+dateFormat.format(fecha));
    				System.out.println("**** Transaction created ****");
    			}  	
    			bw.newLine();	
 		       	bw.flush(); 
 		        
    		} catch (IOException e) {
    			e.printStackTrace();
    		}
    	
    }
    
}