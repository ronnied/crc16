/**
 * Example CRC16 using a 32 byte buffer
 *
 * First 30 bytes represent the payload,
 * the last 2 bytes represent the CRC checksum
 *
 * Ronald Diaz
 */
#include <CRC16.h>

// Declare 32 byte buffer
byte text[] = "0123456789ABCEDFGHIJKLMNOPQRTU  ";

CRC crc;

void setup ()
{
  Serial.begin (57600) ;
  Serial.println("CRC16 test") ;
   
  Serial.println("Original 32byte buffer");
  Serial.write(text, 32);
  Serial.println(" ");
    
  crc.appendCRC16(text, 32);  
  Serial.println("CRC16 appended 32byte buffer");
  Serial.write(text, 32);
  Serial.println(" ");
  
  Serial.println("Verify CRC");
  bool verify = crc.verifyCRC16(text, 32);
  
  Serial.println("Verify result");
  Serial.println(verify);
  
  Serial.println("Corrupt array test");
  text[3] = 0x093;

  Serial.println("Verify CRC");
  verify = crc.verifyCRC16(text, 32);
  
  Serial.println("Verify result");
  Serial.println(verify);  
}

void loop () 
{}