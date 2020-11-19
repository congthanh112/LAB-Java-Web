package com.hoald.cake;

import com.hoald.categry.Category;
import com.hoald.order.OrderDetail;
import com.hoald.updatedetail.UpdateDetail;
import java.math.BigDecimal;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2020-10-16T09:24:30")
@StaticMetamodel(Cake.class)
public class Cake_ { 

    public static volatile SingularAttribute<Cake, Date> exprirationDate;
    public static volatile SingularAttribute<Cake, Integer> quantity;
    public static volatile CollectionAttribute<Cake, OrderDetail> orderDetailCollection;
    public static volatile SingularAttribute<Cake, String> imagePath;
    public static volatile SingularAttribute<Cake, BigDecimal> price;
    public static volatile SingularAttribute<Cake, String> name;
    public static volatile SingularAttribute<Cake, String> description;
    public static volatile SingularAttribute<Cake, Integer> id;
    public static volatile CollectionAttribute<Cake, UpdateDetail> updateDetailCollection;
    public static volatile SingularAttribute<Cake, Category> categoryId;
    public static volatile SingularAttribute<Cake, Date> createDate;
    public static volatile SingularAttribute<Cake, Boolean> status;

}