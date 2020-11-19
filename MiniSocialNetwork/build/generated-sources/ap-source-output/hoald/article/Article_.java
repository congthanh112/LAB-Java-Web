package hoald.article;

import hoald.comment.Comment;
import hoald.emotion.Emotion;
import hoald.notification.Notification;
import hoald.user.Users;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2020-10-21T12:24:16")
@StaticMetamodel(Article.class)
public class Article_ { 

    public static volatile SingularAttribute<Article, Date> date;
    public static volatile CollectionAttribute<Article, Notification> notificationCollection;
    public static volatile SingularAttribute<Article, String> imagePath;
    public static volatile CollectionAttribute<Article, Comment> commentCollection;
    public static volatile SingularAttribute<Article, Integer> articleId;
    public static volatile SingularAttribute<Article, String> description;
    public static volatile CollectionAttribute<Article, Emotion> emotionCollection;
    public static volatile SingularAttribute<Article, String> title;
    public static volatile SingularAttribute<Article, Users> userId;
    public static volatile SingularAttribute<Article, Boolean> status;

}