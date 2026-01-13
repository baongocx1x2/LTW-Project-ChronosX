package util;

import jakarta.mail.*;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import java.util.Properties;
import java.util.logging.Logger;

/**
 * Service để gửi email
 */
public class EmailService {
    private static final Logger logger = Logger.getLogger(EmailService.class.getName());
    
    /**
     * Gửi email đơn giản
     * @param to Địa chỉ email người nhận
     * @param subject Tiêu đề email
     * @param body Nội dung email (HTML hoặc text)
     * @return true nếu gửi thành công, false nếu có lỗi
     */
    public static boolean sendEmail(String to, String subject, String body) {
        if (!EmailConfig.isConfigured()) {
            logger.warning("Email chưa được cấu hình. Vui lòng cấu hình mail.username và mail.password");
            return false;
        }
        
        try {
            // Kiểm tra xem thư viện có sẵn không
            Class.forName("jakarta.mail.Session");
            Class.forName("jakarta.activation.DataHandler");
        } catch (ClassNotFoundException e) {
            logger.warning("Thư viện Jakarta Mail hoặc Jakarta Activation chưa được thêm vào project.");
            logger.warning("Vui lòng thêm các file JAR vào WEB-INF/lib:");
            logger.warning("- jakarta.mail-api-2.1.2.jar");
            logger.warning("- jakarta.mail-2.0.1.jar");
            logger.warning("- jakarta.activation-api-2.1.2.jar");
            logger.warning("- angus-activation-2.0.1.jar");
            return false;
        }
        
        try {
            Properties props = EmailConfig.getMailProperties();
            Session session = Session.getInstance(props, new Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(
                        EmailConfig.getEmailUsername(),
                        EmailConfig.getEmailPassword()
                    );
                }
            });
            
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(
                EmailConfig.getEmailFrom(),
                EmailConfig.getEmailFromName()
            ));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
            message.setSubject(subject);
            message.setContent(body, "text/html; charset=UTF-8");
            
            Transport.send(message);
            logger.info("Email đã được gửi thành công đến: " + to);
            return true;
            
        } catch (NoClassDefFoundError | Exception e) {
            logger.severe("Lỗi khi gửi email: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }
    
    /**
     * Gửi email xác nhận đơn hàng
     * @param toEmail Email người nhận
     * @param orderId Mã đơn hàng
     * @param customerName Tên khách hàng
     * @param orderDetails Chi tiết đơn hàng (HTML)
     * @param totalAmount Tổng tiền
     * @return true nếu gửi thành công
     */
    public static boolean sendOrderConfirmationEmail(
            String toEmail, 
            int orderId, 
            String customerName,
            String orderDetails,
            double totalAmount) {
        
        String subject = "Xác nhận đơn hàng #" + orderId + " - ChronosX";
        
        String body = buildOrderConfirmationEmailBody(
            orderId, 
            customerName, 
            orderDetails, 
            totalAmount
        );
        
        return sendEmail(toEmail, subject, body);
    }
    
    /**
     * Tạo nội dung email xác nhận đơn hàng
     */
    private static String buildOrderConfirmationEmailBody(
            int orderId,
            String customerName,
            String orderDetails,
            double totalAmount) {
        
        return "<!DOCTYPE html>" +
            "<html>" +
            "<head>" +
            "<meta charset='UTF-8'>" +
            "<style>" +
            "body { font-family: Arial, sans-serif; line-height: 1.6; color: #333; }" +
            ".container { max-width: 600px; margin: 0 auto; padding: 20px; }" +
            ".header { background-color: #007bff; color: white; padding: 20px; text-align: center; }" +
            ".content { padding: 20px; background-color: #f9f9f9; }" +
            ".order-info { background-color: white; padding: 15px; margin: 15px 0; border-left: 4px solid #007bff; }" +
            ".order-details { background-color: white; padding: 15px; margin: 15px 0; }" +
            "table { width: 100%; border-collapse: collapse; }" +
            "th, td { padding: 10px; text-align: left; border-bottom: 1px solid #ddd; }" +
            "th { background-color: #f2f2f2; }" +
            ".total { font-size: 18px; font-weight: bold; color: #007bff; margin-top: 15px; }" +
            ".footer { text-align: center; padding: 20px; color: #666; font-size: 12px; }" +
            "</style>" +
            "</head>" +
            "<body>" +
            "<div class='container'>" +
            "<div class='header'>" +
            "<h1>ChronosX Watch Store</h1>" +
            "<h2>Xác nhận đơn hàng</h2>" +
            "</div>" +
            "<div class='content'>" +
            "<p>Xin chào <strong>" + customerName + "</strong>,</p>" +
            "<p>Cảm ơn bạn đã đặt hàng tại ChronosX. Đơn hàng của bạn đã được tiếp nhận và đang được xử lý.</p>" +
            "<div class='order-info'>" +
            "<h3>Thông tin đơn hàng</h3>" +
            "<p><strong>Mã đơn hàng:</strong> #" + orderId + "</p>" +
            "<p><strong>Trạng thái:</strong> Đang xử lý</p>" +
            "</div>" +
            "<div class='order-details'>" +
            "<h3>Chi tiết đơn hàng</h3>" +
            orderDetails +
            "<div class='total'>Tổng tiền: " + String.format("%,.0f", totalAmount) + " VND</div>" +
            "</div>" +
            "<p>Chúng tôi sẽ gửi email cập nhật khi đơn hàng được vận chuyển.</p>" +
            "<p>Nếu bạn có bất kỳ câu hỏi nào, vui lòng liên hệ với chúng tôi.</p>" +
            "</div>" +
            "<div class='footer'>" +
            "<p>© 2024 ChronosX Watch Store. Tất cả quyền được bảo lưu.</p>" +
            "</div>" +
            "</div>" +
            "</body>" +
            "</html>";
    }
    
    /**
     * Gửi email đăng ký thành công
     */
    public static boolean sendWelcomeEmail(String toEmail, String customerName) {
        String subject = "Chào mừng đến với ChronosX";
        String body = "<!DOCTYPE html>" +
            "<html>" +
            "<head><meta charset='UTF-8'></head>" +
            "<body style='font-family: Arial, sans-serif;'>" +
            "<div style='max-width: 600px; margin: 0 auto; padding: 20px;'>" +
            "<h2 style='color: #007bff;'>Chào mừng đến với ChronosX!</h2>" +
            "<p>Xin chào <strong>" + customerName + "</strong>,</p>" +
            "<p>Cảm ơn bạn đã đăng ký tài khoản tại ChronosX Watch Store.</p>" +
            "<p>Bây giờ bạn có thể:</p>" +
            "<ul>" +
            "<li>Mua sắm các sản phẩm đồng hồ cao cấp</li>" +
            "<li>Theo dõi đơn hàng của bạn</li>" +
            "<li>Nhận các ưu đãi đặc biệt</li>" +
            "</ul>" +
            "<p>Chúc bạn mua sắm vui vẻ!</p>" +
            "<p>Trân trọng,<br>Đội ngũ ChronosX</p>" +
            "</div>" +
            "</body>" +
            "</html>";
        
        return sendEmail(toEmail, subject, body);
    }
}
