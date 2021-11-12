package ca.jrvs.apps.practice;

import java.util.regex.Pattern;

public class RegexExcImp implements RegexExc {


  public static void main(String[] args) {
    // TODO Auto-generated method stub
    RegexExcImp obj = new RegexExcImp();

    String filename = "Regex1.jpeg";
    System.out.println(obj.matchJpeg(filename));
    String ip = "192.168.2.1";
    System.out.println(obj.matchIp(ip));
    String line = " ";
    System.out.println(obj.isEmptyLine(line));

  }

  @Override
  public boolean matchJpeg(String filename) {
    // TODO Auto-generated method stub
    String regex = ".*\\.(jpeg|jpg)";
    return Pattern.compile(regex, Pattern.CASE_INSENSITIVE).matcher(filename).matches();
  }

  @Override
  public boolean matchIp(String ip) {
    // TODO Auto-generated method stub
    String regex = "\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}";
    return Pattern.compile(regex).matcher(ip).matches();
  }

  @Override
  public boolean isEmptyLine(String line) {
    // TODO Auto-generated method stub
    String regex = "^\\s*$";
    return Pattern.compile(regex).matcher(line).matches();
  }

}
