package hoald.comment;

import hoald.article.Article;
import hoald.user.Users;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2020-10-21T12:24:16")
@StaticMetamodel(Comment.class)
public class Comment_ { 

    public static volatile SingularAttribute<Comment, Date> date;
    public static volatile SingularAttribute<Comment, Article> articleId;
    public static volatile SingularAttribute<Comment, Integer> commentId;
    public static volatile SingularAttribute<Comment, String> commentContent;
    public static volatile SingularAttribute<Comment, Users> userId;
    public static volatile SingularAttribute<Comment, Boolean> status;

}