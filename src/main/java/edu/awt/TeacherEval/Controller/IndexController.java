package edu.awt.TeacherEval.Controller;

import java.sql.SQLDataException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import edu.awt.TeacherEval.Entites.*;
import edu.awt.TeacherEval.Service.DataService;

@Controller
public class IndexController {

	@Autowired
	DataService ds;

	int globalregno = 0;
	int globalcid = 0;
	int globalsid = 0;
	String[] lgrade = {"A","B","C","D"};

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String Index(ModelMap map) {

		return "Login";

	}

	@RequestMapping(value = "/", method = RequestMethod.POST)
	public String IndexPost(ModelMap map, @RequestParam Integer regno, @RequestParam String password) {

		Users user = ds.getUser(regno, password);
		Participant participant = ds.getParticipant(regno);
		if (user != null) {
			if (user.getType() == 1) {
				if (participant == null) {
					globalregno = regno;
					map.addAttribute("courses", ds.getCourses(regno));
					map.addAttribute("questions", ds.getQuestions());
					map.addAttribute("teachers", ds.getTeacher());
					map.addAttribute("grades", lgrade);
					return "Evaluation";
				} else {
					map.addAttribute("msg", "You have already evaluated!");
					return "Login";
				}

			} else {
				map.addAttribute("sections", ds.getSections());
				return "Section";
			}

		} else {

			map.addAttribute("message", "Username or Password is incorrect!");
			return "Login";
		}

	}
	@RequestMapping(value = "/Section", method = RequestMethod.GET)
	public String Sections(ModelMap map){
		map.addAttribute("sections", ds.getSections());
		return "Section";
	}
	

	
	
	@RequestMapping(value = "/Course", method = RequestMethod.GET)
	public String Courses(ModelMap map, @RequestParam Integer secid){
		globalsid = secid;
		map.addAttribute("courses", ds.getCoursesBySId(secid));
		map.addAttribute("sections", ds.getSections());
		map.addAttribute("teachers", ds.getTeacher());
		return "Course";
		
	}
	
	@RequestMapping(value = "/Result", method = RequestMethod.GET)
	public String Result(ModelMap map, @RequestParam Integer courseid){
		map.addAttribute("questions", ds.getQuestions());
		map.addAttribute("evaluation", ds.getResult(courseid, globalsid));
		map.addAttribute("secid", globalsid);
		//System.out.println(courseid+"-"+globalsid);	
		for(String a: lgrade){
			if(a == "A"){
				List<Object[]> evalcount = ds.getCount(courseid, globalsid, a);
				map.addAttribute("evalcounta", evalcount);
				map.addAttribute("totala", ds.getTotal(courseid, globalsid, a));
			}
			if(a == "B"){
				List<Object[]> evalcount = ds.getCount(courseid, globalsid, a);
				map.addAttribute("evalcountb", evalcount);
				map.addAttribute("totalb", ds.getTotal(courseid, globalsid, a));
			}
			if(a == "C"){
				List<Object[]> evalcount = ds.getCount(courseid, globalsid, a);
				map.addAttribute("evalcountc", evalcount);
				map.addAttribute("totalc", ds.getTotal(courseid, globalsid, a));
			}
			if(a == "D"){
				List<Object[]> evalcount = ds.getCount(courseid, globalsid, a);
				map.addAttribute("evalcountd", evalcount);
				map.addAttribute("totald", ds.getTotal(courseid, globalsid, a));
			}
		}
		map.addAttribute("grades", lgrade);
		return "Result";
		
	}
	
	
	@RequestMapping(value = "/Save", method = RequestMethod.POST)
	public String Save(ModelMap map, @RequestParam String[] evaluation) throws SQLDataException {
		try{
			ds.saveParticipant(globalregno);
			Users user = ds.getUserByRegno(globalregno);
			int sid = user.getSid();
			int pid = user.getRegNo();

			for (String eval : evaluation) {
				String[] participant = eval.split("-");
				for (int i = 0; i < 1; i++) {
					String b = participant[0];
					String c = participant[1];
					String d = participant[2];

					int cid = Integer.parseInt(b.toString());
					int qid = Integer.parseInt(c.toString());
					String grade = d;
					System.out.println(pid + "-" + cid + "-" + qid + "-" + grade + "-" + sid);
					ds.saveEvaluation(pid, cid, qid, grade, sid);
				}
			}
			return "Save";
			
			
		}catch (Exception e) {
			map.addAttribute("exception", "You have already submitted!");
			return "Save";
		}
		
		
	}

}
