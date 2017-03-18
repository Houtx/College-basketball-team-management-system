package ubtms.module.community.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import ubtms.module.community.dto.CommentDto;
import ubtms.module.community.entity.Comment;
import ubtms.module.community.entity.CommentExample;
import ubtms.module.community.entity.CommentQuery;

public interface CommentMapper {
    List<CommentDto> selectByCommentQuery(CommentQuery commentQuery);

    int countByCommentQuery(CommentQuery commentQuery);

    int countByExample(CommentExample example);

    int deleteByExample(CommentExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Comment record);

    int insertSelective(Comment record);

    List<Comment> selectByExampleWithBLOBs(CommentExample example);

    List<Comment> selectByExample(CommentExample example);

    Comment selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Comment record, @Param("example") CommentExample example);

    int updateByExampleWithBLOBs(@Param("record") Comment record, @Param("example") CommentExample example);

    int updateByExample(@Param("record") Comment record, @Param("example") CommentExample example);

    int updateByPrimaryKeySelective(Comment record);

    int updateByPrimaryKeyWithBLOBs(Comment record);

    int updateByPrimaryKey(Comment record);
}