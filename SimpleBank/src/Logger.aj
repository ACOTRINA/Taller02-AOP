import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

public aspect Logger {
	String tipo ="";
    File file = new File("log.txt");
    pointcut success() : call(* moneyM*(..) );
    after() : success() {
    	tipo="transaccion";
    	System.out.println("Tipo de transacción: "+tipo);
    }
    pointcut retiro() : call(* moneyW*(..) );
    after() : retiro() {
    	tipo="retiro";
    	System.out.println("Tipo de transacción: "+tipo);
    }
    pointcut total() : call(* money*(..) );
    after() : total() {
    	try(BufferedWriter bw = new BufferedWriter(new FileWriter(new File("log.txt"),true))){
    		SimpleDateFormat dateFormat  = new SimpleDateFormat("HH:mm:ss");
    		Date date = new Date();    
            System.out.println("Transacción realizada a las " + dateFormat.format(date));
            bw.append("Tipo: "+tipo); 
            bw.append("\tHora: "+dateFormat.format(date)); 		
    		bw.newLine();
    		}catch(Exception e){
    			System.out.println("Error: "+e);
    		}
    }
}


