/**
 * Validation Utility - Client-side validation
 * Kiểm tra dữ liệu ngay khi người dùng nhập
 */

// Regex patterns
const EMAIL_PATTERN = /^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$/;
const USERNAME_PATTERN = /^[a-zA-Z0-9_]{3,20}$/;
const VIETNAMESE_NAME_PATTERN = /^[\p{L}\s]{2,50}$/u;

// Validation functions
const Validation = {
    /**
     * Kiểm tra chuỗi rỗng
     */
    isEmpty: function(str) {
        return !str || str.trim().length === 0;
    },

    /**
     * Kiểm tra độ dài
     */
    isValidLength: function(str, min, max) {
        if (!str) return false;
        const length = str.trim().length;
        return length >= min && length <= max;
    },

    /**
     * Validate username
     */
    validateUsername: function(username) {
        if (this.isEmpty(username)) {
            return { isValid: false, message: "Tên đăng nhập không được để trống" };
        }
        if (!this.isValidLength(username, 3, 20)) {
            return { isValid: false, message: "Tên đăng nhập phải có độ dài từ 3 đến 20 ký tự" };
        }
        if (!USERNAME_PATTERN.test(username)) {
            return { isValid: false, message: "Tên đăng nhập chỉ được chứa chữ cái, số và dấu gạch dưới" };
        }
        return { isValid: true, message: "" };
    },

    /**
     * Validate email
     */
    validateEmail: function(email) {
        if (this.isEmpty(email)) {
            return { isValid: false, message: "Email không được để trống" };
        }
        if (!EMAIL_PATTERN.test(email.trim())) {
            return { isValid: false, message: "Email không đúng định dạng" };
        }
        if (!this.isValidLength(email, 5, 100)) {
            return { isValid: false, message: "Email phải có độ dài từ 5 đến 100 ký tự" };
        }
        return { isValid: true, message: "" };
    },

    /**
     * Validate password
     */
    validatePassword: function(password) {
        if (this.isEmpty(password)) {
            return { isValid: false, message: "Mật khẩu không được để trống" };
        }
        if (password.length < 6) {
            return { isValid: false, message: "Mật khẩu phải có ít nhất 6 ký tự" };
        }
        if (password.length > 50) {
            return { isValid: false, message: "Mật khẩu không được vượt quá 50 ký tự" };
        }
        return { isValid: true, message: "" };
    },

    /**
     * Validate fullname
     */
    validateFullname: function(fullname) {
        if (this.isEmpty(fullname)) {
            return { isValid: false, message: "Họ và tên không được để trống" };
        }
        if (!this.isValidLength(fullname, 2, 50)) {
            return { isValid: false, message: "Họ và tên phải có độ dài từ 2 đến 50 ký tự" };
        }
        if (!VIETNAMESE_NAME_PATTERN.test(fullname.trim())) {
            return { isValid: false, message: "Họ và tên chỉ được chứa chữ cái và khoảng trắng" };
        }
        return { isValid: true, message: "" };
    },

    /**
     * Validate product name
     */
    validateProductName: function(name) {
        if (this.isEmpty(name)) {
            return { isValid: false, message: "Tên sản phẩm không được để trống" };
        }
        if (!this.isValidLength(name, 1, 200)) {
            return { isValid: false, message: "Tên sản phẩm phải có độ dài từ 1 đến 200 ký tự" };
        }
        return { isValid: true, message: "" };
    },

    /**
     * Validate price
     */
    validatePrice: function(priceStr) {
        if (this.isEmpty(priceStr)) {
            return { isValid: false, message: "Giá sản phẩm không được để trống" };
        }
        const price = parseFloat(priceStr.trim());
        if (isNaN(price)) {
            return { isValid: false, message: "Giá sản phẩm phải là số hợp lệ" };
        }
        if (price < 0.01) {
            return { isValid: false, message: "Giá sản phẩm phải lớn hơn 0" };
        }
        if (price > 999999999.99) {
            return { isValid: false, message: "Giá sản phẩm quá lớn" };
        }
        return { isValid: true, message: "" };
    },

    /**
     * Validate description
     */
    validateDescription: function(description) {
        if (this.isEmpty(description)) {
            return { isValid: false, message: "Mô tả sản phẩm không được để trống" };
        }
        if (!this.isValidLength(description, 1, 1000)) {
            return { isValid: false, message: "Mô tả sản phẩm phải có độ dài từ 1 đến 1000 ký tự" };
        }
        return { isValid: true, message: "" };
    },

    /**
     * Validate brand
     */
    validateBrand: function(brand) {
        if (this.isEmpty(brand)) {
            return { isValid: false, message: "Thương hiệu không được để trống" };
        }
        if (!this.isValidLength(brand, 1, 50)) {
            return { isValid: false, message: "Thương hiệu phải có độ dài từ 1 đến 50 ký tự" };
        }
        return { isValid: true, message: "" };
    },

    /**
     * Validate quantity
     */
    validateQuantity: function(quantityStr) {
        if (this.isEmpty(quantityStr)) {
            return { isValid: false, message: "Số lượng không được để trống" };
        }
        const quantity = parseInt(quantityStr.trim());
        if (isNaN(quantity)) {
            return { isValid: false, message: "Số lượng phải là số nguyên hợp lệ" };
        }
        if (quantity <= 0) {
            return { isValid: false, message: "Số lượng phải lớn hơn 0" };
        }
        if (quantity > 9999) {
            return { isValid: false, message: "Số lượng không được vượt quá 9999" };
        }
        return { isValid: true, message: "" };
    },

    /**
     * Validate password confirmation
     */
    validatePasswordConfirm: function(password, confirmPassword) {
        if (this.isEmpty(confirmPassword)) {
            return { isValid: false, message: "Xác nhận mật khẩu không được để trống" };
        }
        if (password !== confirmPassword) {
            return { isValid: false, message: "Mật khẩu xác nhận không khớp" };
        }
        return { isValid: true, message: "" };
    }
};

/**
 * Hiển thị thông báo lỗi validation
 */
function showValidationError(input, message) {
    // Xóa thông báo lỗi cũ
    const existingError = input.parentElement.querySelector('.validation-error');
    if (existingError) {
        existingError.remove();
    }

    // Xóa class invalid cũ
    input.classList.remove('is-invalid');
    input.classList.remove('is-valid');

    if (message) {
        // Thêm class invalid
        input.classList.add('is-invalid');
        
        // Tạo và hiển thị thông báo lỗi
        const errorDiv = document.createElement('div');
        errorDiv.className = 'validation-error invalid-feedback';
        errorDiv.textContent = message;
        input.parentElement.appendChild(errorDiv);
    } else {
        // Thêm class valid nếu không có lỗi
        input.classList.add('is-valid');
    }
}

/**
 * Setup real-time validation cho input
 */
function setupRealTimeValidation(input, validator) {
    // Validate khi người dùng nhập (input event)
    input.addEventListener('input', function() {
        const value = this.value;
        const result = validator(value);
        showValidationError(this, result.isValid ? '' : result.message);
    });

    // Validate khi người dùng rời khỏi trường (blur event)
    input.addEventListener('blur', function() {
        const value = this.value;
        const result = validator(value);
        showValidationError(this, result.isValid ? '' : result.message);
    });
}

/**
 * Setup validation cho form đăng ký
 */
function setupRegisterForm() {
    const form = document.querySelector('form[action="auth"]');
    if (!form || !form.querySelector('input[name="action"][value="register"]')) {
        return;
    }

    const usernameInput = form.querySelector('input[name="username"]');
    const emailInput = form.querySelector('input[name="email"]');
    const fullnameInput = form.querySelector('input[name="fullname"]');
    const passwordInput = form.querySelector('input[name="password"]');
    const confirmPasswordInput = form.querySelector('input[name="confirmPassword"]');

    if (usernameInput) {
        setupRealTimeValidation(usernameInput, (value) => Validation.validateUsername(value));
    }

    if (emailInput) {
        setupRealTimeValidation(emailInput, (value) => Validation.validateEmail(value));
    }

    if (fullnameInput) {
        setupRealTimeValidation(fullnameInput, (value) => Validation.validateFullname(value));
    }

    if (passwordInput) {
        setupRealTimeValidation(passwordInput, (value) => Validation.validatePassword(value));
        
        // Validate confirm password khi password thay đổi
        if (confirmPasswordInput) {
            passwordInput.addEventListener('input', function() {
                const confirmValue = confirmPasswordInput.value;
                if (confirmValue) {
                    const result = Validation.validatePasswordConfirm(this.value, confirmValue);
                    showValidationError(confirmPasswordInput, result.isValid ? '' : result.message);
                }
            });
        }
    }

    if (confirmPasswordInput && passwordInput) {
        setupRealTimeValidation(confirmPasswordInput, (value) => 
            Validation.validatePasswordConfirm(passwordInput.value, value)
        );
    }

    // Validate form khi submit
    form.addEventListener('submit', function(e) {
        let isValid = true;

        if (usernameInput) {
            const result = Validation.validateUsername(usernameInput.value);
            if (!result.isValid) {
                showValidationError(usernameInput, result.message);
                isValid = false;
            }
        }

        if (emailInput) {
            const result = Validation.validateEmail(emailInput.value);
            if (!result.isValid) {
                showValidationError(emailInput, result.message);
                isValid = false;
            }
        }

        if (fullnameInput) {
            const result = Validation.validateFullname(fullnameInput.value);
            if (!result.isValid) {
                showValidationError(fullnameInput, result.message);
                isValid = false;
            }
        }

        if (passwordInput) {
            const result = Validation.validatePassword(passwordInput.value);
            if (!result.isValid) {
                showValidationError(passwordInput, result.message);
                isValid = false;
            }
        }

        if (confirmPasswordInput && passwordInput) {
            const result = Validation.validatePasswordConfirm(passwordInput.value, confirmPasswordInput.value);
            if (!result.isValid) {
                showValidationError(confirmPasswordInput, result.message);
                isValid = false;
            }
        }

        if (!isValid) {
            e.preventDefault();
            return false;
        }
    });
}

/**
 * Setup validation cho form đăng nhập
 */
function setupLoginForm() {
    const form = document.querySelector('form[action="auth"]');
    if (!form || !form.querySelector('input[name="action"][value="login"]')) {
        return;
    }

    const usernameInput = form.querySelector('input[name="username"]');
    const passwordInput = form.querySelector('input[name="password"]');

    if (usernameInput) {
        setupRealTimeValidation(usernameInput, (value) => {
            if (Validation.isEmpty(value)) {
                return { isValid: false, message: "Tên đăng nhập không được để trống" };
            }
            return { isValid: true, message: "" };
        });
    }

    if (passwordInput) {
        setupRealTimeValidation(passwordInput, (value) => {
            if (Validation.isEmpty(value)) {
                return { isValid: false, message: "Mật khẩu không được để trống" };
            }
            return { isValid: true, message: "" };
        });
    }
}

/**
 * Setup validation cho form sản phẩm (admin)
 */
function setupProductForm() {
    const form = document.querySelector('form[action="admin"]');
    if (!form) {
        return;
    }
    
    // Chỉ xử lý form có action="add" hoặc "update"
    const actionInput = form.querySelector('input[name="action"]');
    if (!actionInput || (actionInput.value !== 'add' && actionInput.value !== 'update')) {
        return;
    }

    const nameInput = form.querySelector('input[name="name"]');
    const brandInput = form.querySelector('input[name="brand"]');
    const priceInput = form.querySelector('input[name="price"]');
    const descriptionInput = form.querySelector('textarea[name="description"], input[name="description"]');

    if (nameInput) {
        setupRealTimeValidation(nameInput, (value) => Validation.validateProductName(value));
    }

    if (brandInput) {
        setupRealTimeValidation(brandInput, (value) => Validation.validateBrand(value));
    }

    if (priceInput) {
        setupRealTimeValidation(priceInput, (value) => Validation.validatePrice(value));
    }

    if (descriptionInput) {
        setupRealTimeValidation(descriptionInput, (value) => Validation.validateDescription(value));
    }
}

/**
 * Setup validation cho form số lượng (giỏ hàng)
 */
function setupQuantityForm() {
    const quantityInputs = document.querySelectorAll('input[name="quantity"]');
    quantityInputs.forEach(input => {
        setupRealTimeValidation(input, (value) => Validation.validateQuantity(value));
        
        // Validate form khi submit
        const form = input.closest('form');
        if (form && !form.hasAttribute('data-validated')) {
            form.setAttribute('data-validated', 'true');
            form.addEventListener('submit', function(e) {
                const qtyValue = input.value;
                const result = Validation.validateQuantity(qtyValue);
                if (!result.isValid) {
                    e.preventDefault();
                    showValidationError(input, result.message);
                    return false;
                }
            });
        }
    });
}

// Khởi tạo validation khi DOM ready
document.addEventListener('DOMContentLoaded', function() {
    setupRegisterForm();
    setupLoginForm();
    setupProductForm();
    setupQuantityForm();
});
