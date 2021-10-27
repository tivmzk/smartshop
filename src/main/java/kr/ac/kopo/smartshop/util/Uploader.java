package kr.ac.kopo.smartshop.util;

import java.io.File;
import java.lang.reflect.Constructor;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

public class Uploader<T extends UploadFile> {
	private final String UPLOAD_PATH = "D:/upload/";
	
	public List<T> makeList(List<MultipartFile> productImage, Class<T> type) throws Exception{
		List<T> list = new ArrayList<T>();
		
		for (MultipartFile file : productImage) {
			if (file.isEmpty() || file == null)
				continue;

			String filename = file.getOriginalFilename();
			String uuid = UUID.randomUUID().toString();

			file.transferTo(new File(String.format("%s%s_%s", UPLOAD_PATH, uuid, filename)));
			Constructor<T> constructor = type.getConstructor();
			T item = (T) constructor.newInstance();
			item.setFilename(filename);
			item.setUuid(uuid);
			
			list.add(item);
		}
		
		return list;
	}
}
