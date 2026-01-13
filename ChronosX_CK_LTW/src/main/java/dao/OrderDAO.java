package dao;

import java.sql.*;
import java.util.*;
import model.CartItem;
import model.Order;
import model.OrderItem;
import model.User;

public class OrderDAO {
    private Connection conn;

    public OrderDAO(Connection conn) {
        this.conn = conn;
    }

    // Thêm đơn hàng mới
    public int createOrder(User user, List<CartItem> cart, double total) throws SQLException {
        String sqlOrder = "INSERT INTO orders(user_id, total, status) VALUES(?,?,?)";
        PreparedStatement psOrder = conn.prepareStatement(sqlOrder, Statement.RETURN_GENERATED_KEYS);
        psOrder.setInt(1, user.getId());
        psOrder.setDouble(2, total);
        psOrder.setString(3, "Pending");
        psOrder.executeUpdate();

        ResultSet rs = psOrder.getGeneratedKeys();
        int orderId = 0;
        if (rs.next()) {
            orderId = rs.getInt(1);
        }

        String sqlItem = "INSERT INTO order_items(order_id, product_id, quantity, price) VALUES(?,?,?,?)";
        PreparedStatement psItem = conn.prepareStatement(sqlItem);
        for (CartItem item : cart) {
            psItem.setInt(1, orderId);
            psItem.setInt(2, item.getProduct().getId());
            psItem.setInt(3, item.getQuantity());
            psItem.setDouble(4, item.getProduct().getPrice());
            psItem.addBatch();
        }
        psItem.executeBatch();

        return orderId;
    }

    // Lấy danh sách đơn hàng của user
    public List<Order> getOrdersByUser(int userId) throws SQLException {
        List<Order> orders = new ArrayList<>();
        String sql = "SELECT * FROM orders WHERE user_id=? ORDER BY order_date DESC";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, userId);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            Order order = new Order();
            order.setId(rs.getInt("id"));
            order.setUserId(rs.getInt("user_id"));
            order.setOrderDate(rs.getTimestamp("order_date"));
            order.setTotal(rs.getDouble("total"));
            order.setStatus(rs.getString("status"));
            orders.add(order);
        }
        return orders;
    }

    // Lấy chi tiết sản phẩm trong đơn hàng
    public List<OrderItem> getOrderItems(int orderId) throws SQLException {
        List<OrderItem> items = new ArrayList<>();
        String sql = "SELECT * FROM order_items WHERE order_id=?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, orderId);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            OrderItem item = new OrderItem();
            item.setId(rs.getInt("id"));
            item.setOrderId(rs.getInt("order_id"));
            item.setProductId(rs.getInt("product_id"));
            item.setQuantity(rs.getInt("quantity"));
            item.setPrice(rs.getDouble("price"));
            items.add(item);
        }
        return items;
    }
}