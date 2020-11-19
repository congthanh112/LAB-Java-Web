package com.hoald.order;

import com.hoald.order.OrderDetail;
import com.hoald.user.Users;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2020-10-16T09:24:30")
@StaticMetamodel(Orders.class)
public class Orders_ { 

    public static volatile SingularAttribute<Orders, String> address;
    public static volatile CollectionAttribute<Orders, OrderDetail> orderDetailCollection;
    public static volatile SingularAttribute<Orders, String> phone;
    public static volatile SingularAttribute<Orders, Integer> id;
    public static volatile SingularAttribute<Orders, Date> time;
    public static volatile SingularAttribute<Orders, Users> userId;
    public static volatile SingularAttribute<Orders, String> customerName;
    public static volatile SingularAttribute<Orders, String> status;

}