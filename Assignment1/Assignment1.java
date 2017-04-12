import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.FilterWriter;
import java.io.IOException;
import java.util.Formatter;
import java.util.Random;

public class Assignment1 {
	
	static File outputFile=new File("Output.txt");
	public static void main(String[] args) {
		
		int N=1;     // N-indicates the nth roll of the dice;N=1 is mainly required to check every first roll in a game
        int point=0; // Point can take values 4,5,6,8,9 or 10
        int wager=100;
        int amount=1000;
        int game=1;  // game- indicates the nth game out of the 10 games(for every strategy)
        int result=0;//result - indicates win(1) or lose(0)
        for(int i=1;i<=5;i++){  // 5 Rounds
        	try {
        		if(!outputFile.exists())				
					outputFile.createNewFile();// creating an output file for entering the results
        			FileWriter fileWriter=new FileWriter(outputFile.getName(),true);
        			BufferedWriter bufferWriter=new BufferedWriter(fileWriter);
        			bufferWriter.write("Round "+i+":"+"\n\n");
        			bufferWriter.close();
        			strategy1(N, point, game, amount, wager, result);// The wager amount remains $100 irrespective of win/loss
        			strategy2(N, point, game, amount, wager, result);// Martingale System
        			strategy3(N, point, game, amount, wager, result);// Reverse Martingale System
			} catch (IOException e) {
					e.printStackTrace();
			}
        }
    }
		
	public static void strategy1(int N, int point, int game, int amount,int wager, int result){
		//EVEN WAGER
		try {
			String headline="Strategy  "+"Number of Games  "+"Ending Balance\n";						
			FileWriter fileWriter=new FileWriter(outputFile.getName(),true);// using the same output file for appending further entries
			BufferedWriter bufferWriter=new BufferedWriter(fileWriter);
			bufferWriter.write(headline);
			
			while(game<=10 && amount!=0){	            
	            result=playRandom(N, point); // roll the dice for every game
	            if(result==1)
	                amount+=wager;//WIN
	            else
	                amount-=wager;//LOSE	            
	            game++;  // continue with the next game
	        }			
			bufferWriter.write("1\t\t\t"+Integer.toString(game-1)+"\t\t\t\t$"+Integer.toString(amount)+"\n");
			bufferWriter.close();			
		} catch (IOException e) {			
			e.printStackTrace();
		}        
    }
	
	public static void strategy2(int N, int point, int game, int amount,int wager, int result){
		//MARTINGALE SYSTEM
		try {
			FileWriter fileWriter=new FileWriter(outputFile.getName(),true);
			BufferedWriter bufferWriter=new BufferedWriter(fileWriter);
			while(game<=10 && amount!=0){	                     
	            result=playRandom(N, point); // roll the dice for every game
	            if(result==1){
	                amount+=wager;//WIN 
	                wager=100;
	            }
	            else{
	                amount-=wager;//LOSE
	                wager*=2;
	            }
	            if(wager>amount)  //available amount is not sufficient to bet;Eg: amount=$600 and wager=$800
	                wager=amount;	            
	            game++;  // continue with the next game
	        }			
			bufferWriter.write("2\t\t\t"+Integer.toString(game-1)+"\t\t\t\t$"+Integer.toString(amount)+"\n");
			bufferWriter.close();			
		} catch (IOException e) {			
			e.printStackTrace();
		}        
    }
	
	public static void strategy3(int N, int point, int game, int amount,int wager, int result){
		//REVERSE MARTINGALE SYSTEM
		try {			
			FileWriter fileWriter=new FileWriter(outputFile.getName(),true);
			BufferedWriter bufferWriter=new BufferedWriter(fileWriter);
			
			while(game<=10 && amount!=0){	             
	            result=playRandom(N, point);  // roll the dice for every game
	            if(result==1){
	                amount+=wager;//WIN 
	                wager*=2;
	            }
	            else{
	                amount-=wager;//LOSE
	                wager=100;
	            }
	            if(wager>amount)  //available amount is not sufficient to bet;Eg: amount=$600 and wager=$800
	                wager=amount;	            
	            game++;  // continue with the next game
	        }
			bufferWriter.write("3\t\t\t"+Integer.toString(game-1)+"\t\t\t\t$"+Integer.toString(amount)+"\n\n");
			bufferWriter.close();
		} catch (IOException e) {			
			e.printStackTrace();
		}        
    }
	
	public static int playRandom(int N, int previousPoint){
        int result=0;
        Random random=new Random();
        int dice1=random.nextInt(6)+1;
        int dice2=random.nextInt(6)+1;
        
        if(N==1){ //first roll of the game
            if(dice1+dice2==7 || dice1+dice2==11)
                return 1;//WIN
            else if(dice1+dice2==2 || dice1+dice2==3 || dice1+dice2==12)
                return 0;//LOSE
            else{ //POINT
                int point=dice1+dice2;
                N++;
                result=playRandom(N, point);
            }          
        }
        else{   //subsequent rolls(in case we get a point)
            if(dice1+dice2==previousPoint)
                return 1;//WIN
            else if(dice1+dice2==7)
                return 0;//LOSE
            else{   //POINT
                N++;
                result=playRandom(N, previousPoint);
            }               
        }
        return result;
    }
}
