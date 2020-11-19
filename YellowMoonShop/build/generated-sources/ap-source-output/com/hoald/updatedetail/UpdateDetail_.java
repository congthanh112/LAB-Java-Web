package com.hoald.updatedetail;

import com.hoald.cake.Cake;
import com.hoald.updatedetail.UpdateDetailPK;
import com.hoald.user.Users;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2020-10-16T09:24:30")
@StaticMetamodel(UpdateDetail.class)
public class UpdateDetail_ { 

    public static volatile SingularAttribute<UpdateDetail, Date> date;
    public static volatile SingularAttribute<UpdateDetail, UpdateDetailPK> updateDetailPK;
    public static volatile SingularAttribute<UpdateDetail, Cake> cake;
    public static volatile SingularAttribute<UpdateDetail, Users> users;

}