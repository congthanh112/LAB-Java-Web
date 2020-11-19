package hoald.emotion;

import hoald.article.Article;
import hoald.emotion.EmotionPK;
import hoald.user.Users;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2020-10-21T12:24:16")
@StaticMetamodel(Emotion.class)
public class Emotion_ { 

    public static volatile SingularAttribute<Emotion, EmotionPK> emotionPK;
    public static volatile SingularAttribute<Emotion, Integer> emotionType;
    public static volatile SingularAttribute<Emotion, Article> article;
    public static volatile SingularAttribute<Emotion, Users> users;

}