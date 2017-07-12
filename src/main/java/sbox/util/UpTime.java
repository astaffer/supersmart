package sbox.util;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import java.time.LocalDateTime;

import javax.swing.Timer;

import lombok.Data;

@Data
public class UpTime {
	int delay;
	String fileName;

	public void start() {
		Timer timer = new Timer(1000 * delay, new ActionListener() {
			public void actionPerformed(ActionEvent evt) {
				Path path = Paths.get(fileName);
				try (BufferedWriter writer = Files.newBufferedWriter(path, StandardCharsets.UTF_8,
						StandardOpenOption.WRITE)) {
					writer.write(LocalDateTime.now().toString());

				} catch (IOException e) {
					// handle the exception
					// basic handling
					System.out.println(e.getMessage());

				}
			}
		});
		timer.start();
	}
}
