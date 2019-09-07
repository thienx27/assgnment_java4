/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ktt.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import ktt.dao.SanPhamDAO;
import ktt.model.Cart;
import ktt.model.Products;
import ktt.model.SanPham;

/**
 *
 * @author 500PING-LT
 */
public class CartController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        if (action.equals("Add to cart 1")) {
            String maSP = request.getParameter("MaSP");
            SanPham sp = SanPhamDAO.getSP(maSP);
            
            Cart shop = (Cart) session.getAttribute("SHOP");
            if (shop == null){
                shop = new Cart();
            }
            
            Products p = new Products(sp);
            shop.addSP(p);
            
            session.setAttribute("SHOP", shop);
            response.sendRedirect("shop.jsp");
        } else if(action.equals("Add to cart 2")){
            String maSP = request.getParameter("MaSP");
            SanPham sp = SanPhamDAO.getSP(maSP);
            
            Cart shop = (Cart) session.getAttribute("SHOP");
            if (shop == null){
                shop = new Cart();
            }
            
            Products p = new Products(sp);
            shop.addSP(p);
            
            session.setAttribute("SHOP", shop);
            response.sendRedirect("index.jsp");
        } else if(action.equals("Add to cart3")){
            String maSP = request.getParameter("txtMaSP");
            int Quantity = Integer.valueOf(request.getParameter("txtQuantity"));
            SanPham sp = SanPhamDAO.getSP(maSP);
            
            Cart shop = (Cart) session.getAttribute("SHOP");
            if (shop == null){
                shop = new Cart();
            }
            
            Products p = new Products(sp);
            shop.addSpWithQuantity(p,Quantity);
            
            session.setAttribute("SHOP", shop);
            response.sendRedirect("product.jsp?&MaSP="+maSP);
        } else if(action.equals("remove cart item1")){
            String maSP = request.getParameter("MaSP");
            response.getWriter().print(maSP);
            Cart shop = (Cart) session.getAttribute("SHOP");
            shop.remove(maSP);
            
            response.sendRedirect("cart.jsp");
        } else if(action.equals("remove cart item2")){
            String maSP = request.getParameter("MaSP");
            response.getWriter().print(maSP);
            Cart shop = (Cart) session.getAttribute("SHOP");
            shop.remove(maSP);
            
            response.sendRedirect("checkout.jsp");
        } else if(action.equals("Add quantity")){
            String maSP = request.getParameter("MaSP");
            Cart shop = (Cart) session.getAttribute("SHOP");
            shop.addSL(maSP);
            response.sendRedirect("cart.jsp");
        } else if(action.equals("Sub quantity")){
            String maSP = request.getParameter("MaSP");
            Cart shop = (Cart) session.getAttribute("SHOP");
            shop.subSL(maSP);
            response.sendRedirect("cart.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
