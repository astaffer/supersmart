package sbox.util;

import com.fasterxml.jackson.databind.*;
import java.io.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

public class JsonUtil {
    public static String dataToJson(Object data) {
        try {
            ObjectMapper mapper = new ObjectMapper();
            mapper.enable(SerializationFeature.INDENT_OUTPUT);
            DateFormat df = new SimpleDateFormat("dd.MM.yyyy");
            mapper.setDateFormat(df);
            StringWriter sw = new StringWriter();
            mapper.writeValue(sw, data);
            return sw.toString();
        } catch (IOException e) {
            throw new RuntimeException("IOEXception while mapping object (" + data + ") to JSON");
        }
    }
    public static String dataToJsonDateExtended(Object data) {
        try {
            ObjectMapper mapper = new ObjectMapper();
            mapper.enable(SerializationFeature.INDENT_OUTPUT);
            DateFormat df = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss");
            mapper.setDateFormat(df);
            StringWriter sw = new StringWriter();
            mapper.writeValue(sw, data);
            return sw.toString();
        } catch (IOException e) {
            throw new RuntimeException("IOEXception while mapping object (" + data + ") to JSON");
        }
    }
}
