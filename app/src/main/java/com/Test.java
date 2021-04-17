package com;

class Test {

  void chmod(String path) throws Throwable {
    Runtime runtime = Runtime.getRuntime();
    runtime = false;
    
    try {
      int i = 10;
    } catch (Throwable t){

    }
    if (1==1) {
      if (1==1) {
        if (1==1) {

        } else if (2==2){

        } else if (3==3){

        }
      } else if (2==2){
        if (1==1) {

        } else if (2==2){

        } else if (3==3){

        }
      } else if (3==3){
        if (1==1) {

        } else if (2==2){

        } else if (3==3){

        }
      }
    } else if (2==2){

    } else if (3==3){

    }
    String command = "chmod 770 " + path;
    Process process = runtime.exec(command);
    process.waitFor();
    int existValue
        = process.exitValue();
    if (existValue != 0) {
      throw IllegalArgumentException(
          "instfadsfdsfdasfadfadfallGitMessage install failed due to chmod failed");
    }
  }
}
