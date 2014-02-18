package com.saturn.website;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
public class CountPerson {
//保存访问量，这样就不会出现从起tomcat访问量就从0算起
 public static void saveCount(String fileName,long count){
  try {
   PrintWriter out = new PrintWriter(new FileWriter(fileName));
   out.print(count);
   out.close();
  } catch (IOException e) {
   e.printStackTrace();
  }
 }
//读出访问量
 public static long replaceCount(String fileName){
  long count =0;
  File file = new File(fileName);
  if(!file.exists()){
   saveCount(fileName,0);
  }
  try {
   BufferedReader bur = new BufferedReader(new FileReader(file));
   count = Long.parseLong(bur.readLine());
  } catch (FileNotFoundException e) {
   e.printStackTrace();
  } catch (IOException e) {
   e.printStackTrace();
   count=0;
  }
  return count;
 }
 }