/**
 *
 * @author Caio Henrique Alvarenga Gonçalves
 * Contact: caioriquea@gmail.com
 *
 */
#include <ESP8266WiFi.h>
#include <FirebaseArduino.h>

#define FIREBASE_HOST "DATABASE HOST URL HERE"
#define FIREBASE_AUTH "DATABASE SECRET HERE"
#define WIFI_SSID "YOUR WIFI SSID HERE"
#define WIFI_PASSWORD "YOUR WIFI PASSWORD HERE"

String valores = "";
float temp = 0;
float UV = 0;
float umidade = 0;
bool seco = true;

void setup()
{
  Serial.begin(115200);
  WiFi.begin(WIFI_SSID, WIFI_PASSWORD);

  while (WiFi.status() != WL_CONNECTED)
  {
    delay(500);
  }

  Firebase.begin(FIREBASE_HOST, FIREBASE_AUTH);
}

void loop()
{
  Serial.println("Obtendo dados...");
  while (Serial.available() == 0);

  // Leia os caracteres até encontrar uma nova linha
  String linha = "";
  char caractere;
  while ((caractere = Serial.read()) != '\n') {
    linha += caractere;
    delay(2); // Aguarde um curto período para permitir a chegada de mais dados
  }
  SeparaDados(linha);
  Firebase.setFloat("Temperatura", temp);
  Firebase.setFloat("Intensidade UV", UV);
  Firebase.setBool("Solo Seco", seco);
}

void SeparaDados(String s)
{
  int i = 0;
  String t = "";
  String v = "";
  String u = "";

  while (s.charAt(i) != ',')
  {
    t += s.charAt(i);
    i++;
  }
  temp = t.toFloat();
  i++;

  while (s.charAt(i) != ',')
  {
    v += s.charAt(i);
    i++;
  }
  UV = v.toFloat();
  i++;

  while (i < s.length())
  {
    u += s.charAt(i);
    i++;
  }
  umidade = u.toFloat();
  if (umidade < 800){
    seco = false;
  }
}
