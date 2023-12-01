/**
 *
 * @author Caio Henrique Alvarenga Gonçalves
 * Contact: caioriquea@gmail.com
 *
 */
/********************************************************************
 * Projeto de monitoramento de Plantas
/********************************************************************/

/*inclusão das bibliotecas necessárias*/
#include <OneWire.h>  
#include <DallasTemperature.h>

/********************************************************************/

#define dados 2 /*o pino de dados do sensor de está ligado na porta 2 do Arduino*/
float umidade = 0;
float UV = 0;
byte indiceUV = 0;
OneWire oneWire(dados);  /*Protocolo OneWire*/
/********************************************************************/
DallasTemperature sensors(&oneWire); /*encaminha referências OneWire para o sensor*/
/********************************************************************/ 
void setup(void) /*laço de configuração*/
{ 
  pinMode(A0, INPUT);
  pinMode(A1, INPUT);
  pinMode(6, OUTPUT);
  pinMode(7, OUTPUT);
  digitalWrite(6, HIGH);
  digitalWrite(7, LOW);
 Serial.begin(115200); /*definição de Baudrate de 9600*/
 sensors.begin(); /*inicia biblioteca*/
} 
void loop(void) /*laço de repetição*/
{ 
 /* use sensors.requestTemperatures() para o requerimento de temperatura de todos os dispositivos ligados */
/********************************************************************/
 sensors.requestTemperatures(); /* Envia o comando para leitura da temperatura */
 umidade = analogRead(A0);
 UV = analogRead(A1);
 indiceUV = map(UV, 0,203,0,10);
/********************************************************************/
  Serial.print(sensors.getTempCByIndex(0));
  Serial.print(",");
  Serial.print(UV);
  Serial.print(",");
  Serial.print(umidade);
  Serial.print("\n");
 delay(1000);
 Serial.end();
 Serial.begin(115200);
}