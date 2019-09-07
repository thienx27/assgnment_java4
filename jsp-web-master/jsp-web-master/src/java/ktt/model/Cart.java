/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ktt.model;

import java.util.HashMap;

/**
 *
 * @author 500PING-LT
 */
public class Cart extends HashMap{
    public void addSP(Products p){
        String maSP = p.getSp().getMaSP();
        if (this.containsKey(maSP)){
            ((Products) this.get(maSP)).setSoLuong(((Products) this.get(maSP)).getSoLuong()+ 1);
        } else{
            this.put(p.getSp().getMaSP(), p);
        }
    }
    
    public void addSpWithQuantity(Products p, int quantity){
        String maSP = p.getSp().getMaSP();
        if (this.containsKey(maSP)){
            ((Products) this.get(maSP)).setSoLuong(((Products) this.get(maSP)).getSoLuong() + quantity);
        } else{
            this.put(p.getSp().getMaSP(), p);
            ((Products) this.get(maSP)).setSoLuong(quantity);
        }
    }
    
    public boolean removeSP(String maSP){
        if (this.containsKey(maSP)){
            this.remove(maSP);
            return true;
        }
        return false;
    }
    
    public void addSL(String maSP){
        if (this.containsKey(maSP)){
            if (((Products) this.get(maSP)).getSoLuong() < 10){
                ((Products) this.get(maSP)).setSoLuong(((Products) this.get(maSP)).getSoLuong()+ 1);
            }
        }
    }
    
    public void subSL(String maSP){
        if (this.containsKey(maSP)){
            if (((Products) this.get(maSP)).getSoLuong() > 1){
                ((Products) this.get(maSP)).setSoLuong(((Products) this.get(maSP)).getSoLuong()- 1);
            }
        }
    }

    public Cart() {
        super();
    }
     
}
