package ca.jrvs.apps.grep;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.List;

public interface JavaGrep {

  /**
   * Top level search workflow
   * @throws IOException
   */
  void process() throws IOException;

  /**
   * Traverse a given directory and return all files
   * @param rootDir
   * @return
   */

  List<File> listFiles(String rootDir) throws FileNotFoundException, IOException;

  /**
   * Read a file and return all the lines
   *
   * Explain FileReader, BufferReader, and  character Encoding
   *
   * @param inputFile file to be read
   * @throws IllegalArgumentException if a given input file is not a file
   * @return
   */
  List<String> readLines(File inputFile) throws IOException;

  /**
   * check if a line contains the regex pattern (passed by user)
   * @param line input string
   * @return true if there is match
   */

  boolean containsPattern(String line);

  /**
   * Write a line to a file
   *
   * Explore: FileOutputStream, OutputStreamWriter, and BufferWriter
   *
   * @param  lines matched lines
   * @throws IOException if write failed
   */
  void writeToFile(List<String> lines) throws IOException;

  String getRootPath();

  void setRootPath(String rootPath);

  String getRegex();

  void setRegex(String regex);

  String grtOutFile();

  String getOutFile();

  void setOutFile(String outFile);
}