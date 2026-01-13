package util;

import java.util.Properties;

/**
 * Cấu hình email cho ứng dụng
 * Có thể cấu hình qua file properties hoặc biến môi trường
 */
public class EmailConfig {
    // SMTP Server Configuration
    private static final String SMTP_HOST = getProperty("mail.smtp.host", "smtp.gmail.com");
    private static final String SMTP_PORT = getProperty("mail.smtp.port", "587");
    private static final String SMTP_AUTH = getProperty("mail.smtp.auth", "true");
    private static final String SMTP_STARTTLS = getProperty("mail.smtp.starttls.enable", "true");
    
    // Email Account
    private static final String EMAIL_USERNAME = getProperty("mail.username", "antoanvabaomathttt@gmail.com");
    private static final String EMAIL_PASSWORD = getProperty("mail.password", "cbxj mziv ffoq yvjr");
    private static final String EMAIL_FROM = getProperty("mail.from", EMAIL_USERNAME);
    private static final String EMAIL_FROM_NAME = getProperty("mail.from.name", "ChronosX Watch Store");
    
    /**
     * Lấy giá trị từ system property hoặc biến môi trường, nếu không có thì dùng giá trị mặc định
     */
    private static String getProperty(String key, String defaultValue) {
        String value = System.getProperty(key);
        if (value == null || value.isEmpty()) {
            value = System.getenv(key.toUpperCase().replace(".", "_"));
        }
        return value != null && !value.isEmpty() ? value : defaultValue;
    }
    
    /**
     * Tạo Properties object cho JavaMail
     */
    public static Properties getMailProperties() {
        Properties props = new Properties();
        props.put("mail.smtp.host", SMTP_HOST);
        props.put("mail.smtp.port", SMTP_PORT);
        props.put("mail.smtp.auth", SMTP_AUTH);
        props.put("mail.smtp.starttls.enable", SMTP_STARTTLS);
        props.put("mail.smtp.ssl.trust", SMTP_HOST);
        return props;
    }
    
    public static String getEmailUsername() {
        return EMAIL_USERNAME;
    }
    
    public static String getEmailPassword() {
        return EMAIL_PASSWORD;
    }
    
    public static String getEmailFrom() {
        return EMAIL_FROM;
    }
    
    public static String getEmailFromName() {
        return EMAIL_FROM_NAME;
    }
    
    /**
     * Kiểm tra xem email đã được cấu hình chưa
     */
    public static boolean isConfigured() {
        return EMAIL_USERNAME != null && !EMAIL_USERNAME.isEmpty() 
            && EMAIL_PASSWORD != null && !EMAIL_PASSWORD.isEmpty();
    }
}
