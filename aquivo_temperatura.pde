
import meter.*;
import processing.serial.*; 


String SerialIn;

Meter m;

Serial port;

void setup(){
  size(500,400);
  background(0,0,0);
  try{
     port = new Serial(this, "COM7",9600);
     
     
  } catch (Exception e){
    println("Dispositivo não encontrado!!");
    println(e); 
    exit();
  }
 
  
  m = new Meter(this,25,10);
  m.setTitleFontSize(20);
  m.setTitleFontName("Arial bold");
  m.setTitle("Temperatura °C");
  
  String[] scaleLabels ={"0","10","20","30","40","50","60","70","80"};
  m.setScaleLabels(scaleLabels);
  m.setScaleFontSize(18);
  m.setScaleFontName("Times new roman bold");
  m.setScaleFontColor(color(200,30,70));
  
  m.setDisplayDigitalMeterValue(true);

  m.setArcColor(color(141,113,178));
  m.setArcThickness(15);
  m.setMaxScaleValue(80);
  m.setMinInputSignal(0);
  m.setMaxInputSignal(80);
}



void draw(){
  
  try{
      if(port.available() > 0){
     
     
      String val = port.readString();
      
      String[] list  = split(val, '\n');
      float temp = float(list[0]);
      
      m.updateMeter(int(temp));
      println(val);
      
    }
  }catch (Exception e){
    println("erro nacomunicação serial!!");
    exit();
  }
  
   
}
