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
    pointcut success2() : call(* *.moneyMakeTransaction() );
    after() : success2() {
    	try(
    			BufferedWriter bw = new BufferedWriter(new FileWriter(new File("log.txt"),true)))
    		{
    			SimpleDateFormat dateFormat  = new SimpleDateFormat("HH:mm:ss");
    			Date fecha = new Date();  
    			bw.write("Transacción realizada a las: "+dateFormat.format(fecha));
    			bw.newLine();
 		       	bw.flush(); 
 		        System.out.println("\n Transaction  "+dateFormat.format(fecha));
    		} catch (IOException e) {
    			e.printStackTrace();
    		}
    	System.out.println("**** Transaction created ****");
    }
    pointcut success3() : call(* *.moneyWithdrawal() );
    after() : success3() {
    	try(
    			BufferedWriter bw = new BufferedWriter(new FileWriter(new File("log.txt"),true)))
    		{
    			SimpleDateFormat dateFormat  = new SimpleDateFormat("HH:mm:ss");
    			Date fecha = new Date();  
    			bw.write("Retiro realizado a las: "+dateFormat.format(fecha));
    			bw.newLine();
 		       	bw.flush();
 		        System.out.println("\n Withdrawal  "+dateFormat.format(fecha));
    		} catch (IOException e) {
    			e.printStackTrace();
    		}
    	System.out.println("**** Withdrawal created ****");
    }
    
}