package hoald.notification;

import hoald.article.Article;
import hoald.user.Users;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2020-10-21T12:24:16")
@StaticMetamodel(Notification.class)
public class Notification_ { 

    public static volatile SingularAttribute<Notification, Date> date;
    public static volatile SingularAttribute<Notification, Article> articleId;
    public static volatile SingularAttribute<Notification, Integer> notificationId;
    public static volatile SingularAttribute<Notification, Integer> activityType;
    public static volatile SingularAttribute<Notification, Boolean> isSeen;
    public static volatile SingularAttribute<Notification, Users> userId;

}