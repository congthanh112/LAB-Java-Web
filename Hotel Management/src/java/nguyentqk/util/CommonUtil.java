/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nguyentqk.util;

import java.util.List;
import java.util.function.Predicate;
import java.util.stream.Collector;
import java.util.stream.Collectors;

/**
 *
 * @author Apple
 */
public class CommonUtil {
    public static <T> List<T> filter(List<T> list, Predicate<T> pre) {
        // filter a list accords to predicate
        return list.stream().filter(pre).collect(Collectors.toList());
    }
    
}
