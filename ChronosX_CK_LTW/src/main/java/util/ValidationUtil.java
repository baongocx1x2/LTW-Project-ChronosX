package util;

import java.util.regex.Pattern;

/**
 * Utility class cung cấp các phương thức validation cho ứng dụng
 * 
 * @author ChronosX Team
 * @version 1.0
 */
public class ValidationUtil {
    
    // Regex patterns
    private static final Pattern EMAIL_PATTERN = Pattern.compile(
        "^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$"
    );
    
    private static final Pattern USERNAME_PATTERN = Pattern.compile(
        "^[a-zA-Z0-9_]{3,20}$"
    );
    
    private static final Pattern VIETNAMESE_NAME_PATTERN = Pattern.compile(
        "^[\\p{L}\\s]{2,50}$"
    );
    
    // Constants
    private static final int MIN_PASSWORD_LENGTH = 6;
    private static final int MAX_PASSWORD_LENGTH = 50;
    private static final double MIN_PRICE = 0.01;
    private static final double MAX_PRICE = 999999999.99;
    
    /**
     * Kiểm tra chuỗi có rỗng hoặc null không
     */
    public static boolean isEmpty(String str) {
        return str == null || str.trim().isEmpty();
    }
    
    /**
     * Kiểm tra độ dài chuỗi
     */
    public static boolean isValidLength(String str, int min, int max) {
        if (str == null) return false;
        int length = str.trim().length();
        return length >= min && length <= max;
    }
    
    /**
     * Validation cho username
     * - Không được rỗng
     * - Độ dài: 3-20 ký tự
     * - Chỉ chứa chữ cái, số và dấu gạch dưới
     */
    public static ValidationResult validateUsername(String username) {
        if (isEmpty(username)) {
            return new ValidationResult(false, "Tên đăng nhập không được để trống");
        }
        
        if (!isValidLength(username, 3, 20)) {
            return new ValidationResult(false, "Tên đăng nhập phải có độ dài từ 3 đến 20 ký tự");
        }
        
        if (!USERNAME_PATTERN.matcher(username).matches()) {
            return new ValidationResult(false, "Tên đăng nhập chỉ được chứa chữ cái, số và dấu gạch dưới");
        }
        
        return new ValidationResult(true, null);
    }
    
    /**
     * Validation cho email
     * - Không được rỗng
     * - Phải đúng định dạng email
     */
    public static ValidationResult validateEmail(String email) {
        if (isEmpty(email)) {
            return new ValidationResult(false, "Email không được để trống");
        }
        
        if (!EMAIL_PATTERN.matcher(email.trim()).matches()) {
            return new ValidationResult(false, "Email không đúng định dạng");
        }
        
        if (!isValidLength(email, 5, 100)) {
            return new ValidationResult(false, "Email phải có độ dài từ 5 đến 100 ký tự");
        }
        
        return new ValidationResult(true, null);
    }
    
    /**
     * Validation cho password
     * - Không được rỗng
     * - Độ dài: 6-50 ký tự
     */
    public static ValidationResult validatePassword(String password) {
        if (isEmpty(password)) {
            return new ValidationResult(false, "Mật khẩu không được để trống");
        }
        
        if (password.length() < MIN_PASSWORD_LENGTH) {
            return new ValidationResult(false, "Mật khẩu phải có ít nhất " + MIN_PASSWORD_LENGTH + " ký tự");
        }
        
        if (password.length() > MAX_PASSWORD_LENGTH) {
            return new ValidationResult(false, "Mật khẩu không được vượt quá " + MAX_PASSWORD_LENGTH + " ký tự");
        }
        
        return new ValidationResult(true, null);
    }
    
    /**
     * Validation cho fullname (họ và tên)
     * - Không được rỗng
     * - Độ dài: 2-50 ký tự
     * - Chỉ chứa chữ cái và khoảng trắng (hỗ trợ tiếng Việt)
     */
    public static ValidationResult validateFullname(String fullname) {
        if (isEmpty(fullname)) {
            return new ValidationResult(false, "Họ và tên không được để trống");
        }
        
        if (!isValidLength(fullname, 2, 50)) {
            return new ValidationResult(false, "Họ và tên phải có độ dài từ 2 đến 50 ký tự");
        }
        
        if (!VIETNAMESE_NAME_PATTERN.matcher(fullname.trim()).matches()) {
            return new ValidationResult(false, "Họ và tên chỉ được chứa chữ cái và khoảng trắng");
        }
        
        return new ValidationResult(true, null);
    }
    
    /**
     * Validation cho tên sản phẩm
     * - Không được rỗng
     * - Độ dài: 1-200 ký tự
     */
    public static ValidationResult validateProductName(String name) {
        if (isEmpty(name)) {
            return new ValidationResult(false, "Tên sản phẩm không được để trống");
        }
        
        if (!isValidLength(name, 1, 200)) {
            return new ValidationResult(false, "Tên sản phẩm phải có độ dài từ 1 đến 200 ký tự");
        }
        
        return new ValidationResult(true, null);
    }
    
    /**
     * Validation cho giá sản phẩm
     * - Phải là số dương
     * - Trong khoảng hợp lệ
     */
    public static ValidationResult validatePrice(String priceStr) {
        if (isEmpty(priceStr)) {
            return new ValidationResult(false, "Giá sản phẩm không được để trống");
        }
        
        try {
            double price = Double.parseDouble(priceStr.trim());
            
            if (price < MIN_PRICE) {
                return new ValidationResult(false, "Giá sản phẩm phải lớn hơn 0");
            }
            
            if (price > MAX_PRICE) {
                return new ValidationResult(false, "Giá sản phẩm quá lớn");
            }
            
            return new ValidationResult(true, null);
        } catch (NumberFormatException e) {
            return new ValidationResult(false, "Giá sản phẩm phải là số hợp lệ");
        }
    }
    
    /**
     * Validation cho mô tả sản phẩm
     * - Không được rỗng
     * - Độ dài: 1-1000 ký tự
     */
    public static ValidationResult validateDescription(String description) {
        if (isEmpty(description)) {
            return new ValidationResult(false, "Mô tả sản phẩm không được để trống");
        }
        
        if (!isValidLength(description, 1, 1000)) {
            return new ValidationResult(false, "Mô tả sản phẩm phải có độ dài từ 1 đến 1000 ký tự");
        }
        
        return new ValidationResult(true, null);
    }
    
    /**
     * Validation cho thương hiệu sản phẩm
     * - Không được rỗng
     * - Độ dài: 1-50 ký tự
     */
    public static ValidationResult validateBrand(String brand) {
        if (isEmpty(brand)) {
            return new ValidationResult(false, "Thương hiệu không được để trống");
        }
        
        if (!isValidLength(brand, 1, 50)) {
            return new ValidationResult(false, "Thương hiệu phải có độ dài từ 1 đến 50 ký tự");
        }
        
        return new ValidationResult(true, null);
    }
    
    /**
     * Validation cho số lượng
     * - Phải là số nguyên dương
     * - Trong khoảng hợp lệ (1-9999)
     */
    public static ValidationResult validateQuantity(String quantityStr) {
        if (isEmpty(quantityStr)) {
            return new ValidationResult(false, "Số lượng không được để trống");
        }
        
        try {
            int quantity = Integer.parseInt(quantityStr.trim());
            
            if (quantity <= 0) {
                return new ValidationResult(false, "Số lượng phải lớn hơn 0");
            }
            
            if (quantity > 9999) {
                return new ValidationResult(false, "Số lượng không được vượt quá 9999");
            }
            
            return new ValidationResult(true, null);
        } catch (NumberFormatException e) {
            return new ValidationResult(false, "Số lượng phải là số nguyên hợp lệ");
        }
    }
    
    /**
     * Validation cho ID (số nguyên dương)
     */
    public static ValidationResult validateId(String idStr) {
        if (isEmpty(idStr)) {
            return new ValidationResult(false, "ID không được để trống");
        }
        
        try {
            int id = Integer.parseInt(idStr.trim());
            
            if (id <= 0) {
                return new ValidationResult(false, "ID phải là số nguyên dương");
            }
            
            return new ValidationResult(true, null);
        } catch (NumberFormatException e) {
            return new ValidationResult(false, "ID phải là số nguyên hợp lệ");
        }
    }
    
    /**
     * Kiểm tra xác nhận mật khẩu có khớp không
     */
    public static ValidationResult validatePasswordConfirm(String password, String confirmPassword) {
        if (isEmpty(confirmPassword)) {
            return new ValidationResult(false, "Xác nhận mật khẩu không được để trống");
        }
        
        if (!password.equals(confirmPassword)) {
            return new ValidationResult(false, "Mật khẩu xác nhận không khớp");
        }
        
        return new ValidationResult(true, null);
    }
    
    /**
     * Class để trả về kết quả validation
     */
    public static class ValidationResult {
        private final boolean isValid;
        private final String errorMessage;
        
        public ValidationResult(boolean isValid, String errorMessage) {
            this.isValid = isValid;
            this.errorMessage = errorMessage;
        }
        
        public boolean isValid() {
            return isValid;
        }
        
        public String getErrorMessage() {
            return errorMessage;
        }
    }
}
