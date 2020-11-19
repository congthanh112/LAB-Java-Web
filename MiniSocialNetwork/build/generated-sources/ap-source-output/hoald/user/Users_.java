package hoald.user;

import hoald.article.Article;
import hoald.comment.Comment;
import hoald.emotion.Emotion;
import hoald.notification.Notification;
import hoald.role.Role;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2020-10-21T12:24:16")
@StaticMetamodel(Users.class)
public class Users_ { 

    public static volatile CollectionAttribute<Users, Article> articleCollection;
    public static volatile CollectionAttribute<Users, Notification> notificationCollection;
    public static volatile SingularAttribute<Users, String> password;
    public static volatile SingularAttribute<Users, String> verifyCode;
    public static volatile SingularAttribute<Users, Role> roleId;
    public static volatile CollectionAttribute<Users, Comment> commentCollection;
    public static volatile SingularAttribute<Users, String> fullName;
    public static volatile CollectionAttribute<Users, Emotion> emotionCollection;
    public static volatile SingularAttribute<Users, String> userId;
    public static volatile SingularAttribute<Users, String> status;

}