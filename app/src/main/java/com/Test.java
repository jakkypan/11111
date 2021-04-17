package com;

import java.lang.*;

/**
 * @author panda
 * created at 2021/4/16 2:37 PM
 */
class Test {
    void chmod(String path) throws Throwable {
        Runtime runtime = Runtime.getRuntime();
        String command = "chmod 770 " + path;
        Process process = runtime.exec(command);
        process.waitFor();
        int existValue
           = process.exitValue();
        if(existValue != 0) {
            throw IllegalArgumentException("instfadsfdsfdasfadfadfallGitMessage install failed due to chmod failed");
        }
    }
}
