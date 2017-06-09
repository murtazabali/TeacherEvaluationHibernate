package edu.awt.TeacherEval.Service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.criterion.Projections;
import org.springframework.stereotype.Service;

import edu.awt.TeacherEval.Entites.*;

@Service
@Transactional
public class DataService extends BaseService {

	public List<?> getQuestions() {
		return getSession().createCriteria(Questions.class).list();
	}

	public Users getUser(int regno, String password) {
		return (Users) getSession().createQuery("From Users WHERE regNo = :regno AND password = :password")
				.setParameter("regno", regno).setParameter("password", password).uniqueResult();
	}

	public Users getUserByRegno(int regno) {
		return (Users) getSession().createQuery("From Users WHERE regNo = :regno")
				.setParameter("regno", regno).uniqueResult();
	}

	public List<?> getGrades() {
		return getSession().createCriteria(Evaluation.class).list();
	}

	public List<?> getCourses(int regno) {
		Users user = (Users) getSession().load(Users.class, regno);
		return getSession().createQuery("From Course WHERE SId = :SId").setParameter("SId", user.getSid()).list();
	}
	
	
	public List<?> getCoursesBySId(int SId) {
		return getSession().createQuery("From Course WHERE SId = :SId").setParameter("SId", SId).list();
	}
	
	public List<?> getSections() {
		return getSession().createQuery("From Section").list();
	}
	
	public Section getSections(int SId) {
		return (Section)getSession().createQuery("From Section WHERE SId = :SId").setParameter("SId", SId).uniqueResult();
	}
	
	
	public List<?> getResult(int cid,int SId) {
		return getSession().createQuery("From Evaluation WHERE cid = :cid AND SId = :SId")
				.setParameter("cid", cid).setParameter("SId", SId)
				.list();
	}
	
//	public List<Integer> getCount(int cid, int SId){
//		List<Integer> count = null;
//		List<Questions> ls = (List<Questions>) getQuestions();
//		int a = 0;
//		for(Questions l: ls){
//			 a = (int) getSession().createQuery("count(grade) From Evaluation WHERE cid = :cid AND SId = :SId And qid = :qid")
//			.setParameter("cid", cid).setParameter("SId", SId).setParameter("qid",l.getQid()).uniqueResult();
//			 count.add(a);
//		}
//		return count;
//	}
	
	
	public List<Object[]> getCount(int cid,int SId,String grade){
		Query aCountQuery  = getSession().createSQLQuery("select count(e.grade),q.qid from Questions q left outer join Evaluation e on e.qid = q.qid and e.cid = :cid and e.SId = :SId and e.grade = :grade group by qid");
		           aCountQuery.setParameter("cid", cid);
		           aCountQuery.setParameter("SId", SId);
		           aCountQuery.setParameter("grade", grade);
		           List<Object[]> resultCount = aCountQuery.list();
		    return resultCount;
	}
	
	public Long getTotal(int cid,int SId,String grade){
		Query aCountQuery  = getSession().createQuery("select count(grade) from Evaluation where cid = :cid and SId = :SId and grade = :grade");
        aCountQuery.setParameter("cid", cid);
        aCountQuery.setParameter("SId", SId);
        aCountQuery.setParameter("grade", grade);
        Long resultCount = (Long)aCountQuery.uniqueResult();
        return resultCount;
	}
	
	public List<?> getTeacher() {
		return getSession().createQuery("From Teacher").list();
	}

	public void saveParticipant(int regno) {
		int pid = regno;

		Participant part = new Participant();
		part.setPId(pid);
		part.setDate(new Date());

		getSession().saveOrUpdate(part);

	}
	
	public Participant getParticipant(int regno) {
		return (Participant) getSession().createQuery("From Participant WHERE pid = :pid")
				.setParameter("pid", regno).uniqueResult();
	}
	

	public void saveEvaluation(int pid, int cid, int qid, String grade, int SId) {
		Participant participant = (Participant) getSession().load(Participant.class, pid);
		Course course = (Course) getSession().load(Course.class, cid);
		Questions question = (Questions) getSession().get(Questions.class, qid);
		Section section = (Section) getSession().get(Section.class, SId);
		
		Evaluation eval = new Evaluation();
		eval.setParticipant(participant);
		eval.setCourse(course);
		eval.setGrade(grade);
		eval.setQuestion(question);
		eval.setSection(section);
		getSession().saveOrUpdate(eval);

	}

}
