package tarunwebsite.shopInfo;

import java.sql.*;
import javax.sql.*;
import java.util.*;
import java.io.*;

public class MerchDAO {

    Connection con;

    public MerchDAO() {
    }

    public Connection getConnection() throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/tarunramaniwebsite", "root", "mikado");
        return con;
    }

    public void closeConnection() throws SQLException {
        con.close();
    }  

    public Vector getAllProducts() throws ClassNotFoundException, SQLException {

        getConnection();
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("select * from Merchandise;");
        
        Vector products = new Vector();
        while(rs.next()) {
            Product product = new Product();

            product.setMerchId(rs.getInt(1));
            product.setMerchName(rs.getString(2));
            product.setMerchDescription(rs.getString(3));
            product.setImagePath(rs.getString(4));
            product.setPrice(rs.getDouble(5));
            product.setTotalVarients(rs.getInt(6));

            int id = rs.getInt(1);

            if(rs.getInt(6) >= 0) {

                Vector<Varient> varients = new Vector<Varient>();
                Statement stmt1 = con.createStatement();
                ResultSet rs1 = stmt1.executeQuery("select * from merchVarients where merchId = " + id + ";");
                    
                while(rs1.next()) {
                    Varient varient = new Varient();
                    varient.setVarientId(rs1.getInt(1));
                    varient.setMerchId(rs1.getInt(2));
                    varient.setVarientDescription(rs1.getString(3));
                    varients.add(varient);
                }
                rs1.close();
                stmt1.close();
                product.setVarients(varients);
            }

            Vector<String> images = new Vector<String>();
            Statement stmt2 = con.createStatement();
            ResultSet rs2 = stmt2.executeQuery("select * from merchImages where merchId = " + id + ";");
                    
            while(rs2.next()) {
                images.add(rs2.getString(2));
            }
            rs2.close();
            stmt2.close();
            product.setImages(images);

            products.add(product);
        }
        rs.close();
        stmt.close();
        closeConnection();
        return products;
    }

    public int getMerchId(int varientId) throws ClassNotFoundException, SQLException {
        int merchId = 0;
        getConnection();
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("select * from merchVarients where varientId = " + varientId + ";");
        while(rs.next()) {
            merchId = rs.getInt(2);
        }
        rs.close();
        stmt.close();
        closeConnection();
        return merchId;
    }

    public boolean addToCart(String varientId, String quantity, String username) throws ClassNotFoundException, SQLException {
        
        boolean result = false;
        int merchId = getMerchId(Integer.parseInt(varientId));
        getConnection();
        Statement stmt = con.createStatement();
        int i = stmt.executeUpdate("update cart set quantity = " + quantity + " where username = '" + username + "' AND varientId = " + varientId + ";");
        if(i != 1) {
            Statement stmt1 = con.createStatement();
            try {
                int i1 = stmt1.executeUpdate("insert into cart (username, varientId, quantity, merchId) values ('" + username + "', " + varientId + ", " + quantity + ", " + merchId + ");");
                if(i1 == 1) {
                    result = true;
                }
                else {
                    result = false;
                }
            }
            catch(Exception e) {
                System.out.println(e);
            }
            finally {
                stmt1.close();
                stmt.close();
                closeConnection();
            }
        }
        else {
            result = true;
        }
        return result;
    }

    public Collection getCartItems(String username) throws ClassNotFoundException, SQLException {
        
        Vector<CartItem> cart = new Vector<CartItem>();
        CartItem ci;
        Item i;

        getConnection();
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("select * from cart where username = '" + username + "';");
        while(rs.next()) {

            ci = new CartItem();
            i = new Item();

            ci.setQuantity(rs.getInt(3));
            ci.setCartId(rs.getInt(5));
            int merchId = rs.getInt(4);
            int varientId = rs.getInt(2);

            i.setVarientId(varientId);
            
            Statement stmt1 = con.createStatement();
            ResultSet rs1 = stmt1.executeQuery("select * from merchVarients where varientId = " + varientId + ";");
            while(rs1.next()) {
                i.setVarientDescriiption(rs1.getString(3));
            }

            i.setMerchId(merchId);
            
            Statement stmt2 = con.createStatement();
            ResultSet rs2 = stmt2.executeQuery("select * from cart where username = '" + username + "';");
            while(rs2.next()) {
                i.setMerchName(rs2.getString(2));
                i.setImagePath(rs2.getString(4));
                i.setPrice(rs2.getInt(5));
            }

            ci.setItem(i);
            cart.add(ci);

            rs1.close();
            stmt1.close();
            rs2.close();
            stmt2.close();
        }
        rs.close();
        stmt.close();
        closeConnection();

        return cart;
    }   
}