package utils;

import cucumber.api.java.gl.E;

public class Examples {

    public static void helloWorld(){
        System.out.println("hello world");
    }

    public static String ramdom(){
        return "rasdakjds";
    }

    public void helloWorldWithInstance(){
        System.out.println("Hello world instance");
    }
    public static Examples createInstance(){
        return new Examples();
    }
    public void receiveObject(String objeto){
        System.out.println(objeto.length());
    }
}
