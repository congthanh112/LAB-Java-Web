package com.hoald.order;

import com.hoald.cake.Cake;
import com.hoald.order.OrderDetailPK;
import com.hoald.order.Orders;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2020-10-16T09:24:30")
@StaticMetamodel(OrderDetail.class)
public class OrderDetail_ { 

    public static volatile SingularAttribute<OrderDetail, Integer> quantity;
    public static volatile SingularAttribute<OrderDetail, Cake> cake;
    public static volatile SingularAttribute<OrderDetail, Orders> orders;
    public static volatile SingularAttribute<OrderDetail, OrderDetailPK> orderDetailPK;

}