package ubtms.module.community.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import ubtms.module.community.dto.ReplyDto;
import ubtms.module.community.entity.Reply;
import ubtms.module.community.entity.ReplyExample;
import ubtms.module.community.entity.ReplyQuery;

public interface ReplyMapper {
    List<ReplyDto> selectByReplyQuery(ReplyQuery replyQuery);
    int countByReplyQuery(ReplyQuery replyQuery);
    int countByExample(ReplyExample example);

    int deleteByExample(ReplyExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Reply record);

    int insertSelective(Reply record);

    List<Reply> selectByExampleWithBLOBs(ReplyExample example);

    List<Reply> selectByExample(ReplyExample example);

    Reply selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Reply record, @Param("example") ReplyExample example);

    int updateByExampleWithBLOBs(@Param("record") Reply record, @Param("example") ReplyExample example);

    int updateByExample(@Param("record") Reply record, @Param("example") ReplyExample example);

    int updateByPrimaryKeySelective(Reply record);

    int updateByPrimaryKeyWithBLOBs(Reply record);

    int updateByPrimaryKey(Reply record);
}