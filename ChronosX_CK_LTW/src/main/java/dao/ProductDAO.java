package dao;

import java.sql.*;
import java.util.*;
import model.*;

public class ProductDAO {
	public List<Product> getAllProducts() {
		List<Product> list = new ArrayList<>();
		try (Connection conn = DBConnection.getConnection()) {
			String sql = "SELECT * FROM products";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Product p = new Product();
				p.setId(rs.getInt("id"));
				p.setName(rs.getString("name"));
				p.setBrand(rs.getString("brand"));
				p.setPrice(rs.getDouble("price"));
				p.setDescription(rs.getString("description"));
				p.setImage(rs.getString("image"));
				list.add(p);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public Product getProductById(int id) {
		Product p = null;
		try (Connection conn = DBConnection.getConnection()) {
			String sql = "SELECT * FROM products WHERE id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				p = new Product();
				p.setId(rs.getInt("id"));
				p.setName(rs.getString("name"));
				p.setBrand(rs.getString("brand"));
				p.setPrice(rs.getDouble("price"));
				p.setDescription(rs.getString("description"));
				p.setImage(rs.getString("image"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return p;
	}

	// Thêm sản phẩm mới
	public void addProduct(Product p) {
		try (Connection conn = DBConnection.getConnection()) {
			String sql = "INSERT INTO products(name, brand, price, description, image) VALUES(?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, p.getName());
			ps.setString(2, p.getBrand());
			ps.setDouble(3, p.getPrice());
			ps.setString(4, p.getDescription());
			ps.setString(5, p.getImage());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// Xóa sản phẩm theo ID
	public void deleteProduct(int id) {
		try (Connection conn = DBConnection.getConnection()) {
			String sql = "DELETE FROM products WHERE id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// Cập nhật sản phẩm
	public void updateProduct(Product p) {
		try (Connection conn = DBConnection.getConnection()) {
			String sql = "UPDATE products SET name=?, brand=?, price=?, description=?, image=? WHERE id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, p.getName());
			ps.setString(2, p.getBrand());
			ps.setDouble(3, p.getPrice());
			ps.setString(4, p.getDescription());
			ps.setString(5, p.getImage());
			ps.setInt(6, p.getId());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}