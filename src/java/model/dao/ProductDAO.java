package model.dao;

import model.entity.Product;
import util.DBConnect;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {
    Connection connection = new DBConnect().connection;

    public List<Product> getAllProducts() {
        List<Product> productList = new ArrayList<>();
        if (connection != null) {
            String sql = "SELECT * FROM Product";
            try {
                Statement statement = connection.createStatement();
                ResultSet resultSet = statement.executeQuery(sql);
                while (resultSet.next()) {
                    Product product = new Product();
                    product.setProductID(resultSet.getInt("ProductID"));
                    product.setProductName(resultSet.getString("ProductName"));
                    product.setPrice(resultSet.getBigDecimal("Price"));
                    product.setDescription(resultSet.getString("Description"));
                    product.setCreatedDate(resultSet.getDate("CreatedDate"));
                    product.setCreatedBy(resultSet.getString("CreatedBy"));
                    product.setUpdatedDate(resultSet.getDate("UpdatedDate"));
                    product.setUpdatedBy(resultSet.getString("UpdatedBy"));
                    product.setDeleted(resultSet.getBoolean("IsDelete"));
                    product.setDeletedDate(resultSet.getDate("DeletedDate"));
                    product.setDeletedBy(resultSet.getString("DeletedBy"));
                    productList.add(product);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return productList;
    }
}