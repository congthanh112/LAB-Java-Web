/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nguyentqk.raw;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;
import nguyentqk.room.RoomDTO;

/**
 *
 * @author Apple
 */
public class Cart implements Serializable {

    private Map<RoomDTO, Integer> items;

    public void addItem(RoomDTO rm) {
        if (items == null) {
            items = new HashMap<>();
        }
        items.put(rm, items.getOrDefault(rm, 0) + 1);
    }
    
    public void removeEntireItem(RoomDTO rm) {
         if (items != null) {
            if (items.containsKey(rm)) {
               items.remove(rm);
            }
            if (items.isEmpty()) items = null;
        }
    }
    
    public  void removeItem(RoomDTO rm) {
        if (items != null) {
            if (items.containsKey(rm)) {
                items.put(rm, items.get(rm) - 1);
                if (items.get(rm) == 0) items.remove(rm);
            }
            if (items.isEmpty()) items = null;
        }
    }

    public Map<RoomDTO, Integer> getItems() {
        return items;
    }

    public void setItems(Map<RoomDTO, Integer> items) {
        this.items = items;
    }
    

    public Map<Integer, Float> getItemsTotalMoney() {
        if (items == null) {
            return null;
        }
        Map<Integer, Float> ret = new HashMap<>();
        items.keySet().forEach((dto) -> {
            float total = dto.getPrice() * items.get(dto);
            ret.put(dto.getRoomID(), total);
        });
        return ret;
    }

    public float getTotalMoney() {
        if (items == null) {
            return 0;
        }
        float total = 0;
        for (RoomDTO dto : items.keySet()) {
            total += dto.getPrice()* items.get(dto);
        }
        return total;
    }

}
