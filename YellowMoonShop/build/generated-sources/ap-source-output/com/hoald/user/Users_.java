package com.hoald.user;

import com.hoald.order.Orders;
import com.hoald.role.Role;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2020-10-16T09:24:30")
@StaticMetamodel(Users.class)
public class Users_ { 

    public static volatile SingularAttribute<Users, String> password;
    public static volatile SingularAttribute<Users, String> address;
    public static volatile SingularAttribute<Users, String> phone;
    public static volatile SingularAttribute<Users, Role> roleId;
    public static volatile SingularAttribute<Users, String> fullName;
    public static volatile SingularAttribute<Users, String> id;
    public static volatile CollectionAttribute<Users, Orders> ordersCollection;
    public static volatile SingularAttribute<Users, Boolean> status;

}