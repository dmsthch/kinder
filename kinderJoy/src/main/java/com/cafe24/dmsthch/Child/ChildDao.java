package com.cafe24.dmsthch.Child;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ChildDao {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	//���ƹߴ��� �� �����ϱ�
	public void addChildDevelopmentDetails(ChildDevelopmentDetails details , Child child){
		//�ʿ��Ѱ� -> �򰡹�ȣ(��), ���̼���, ����, ���׹�ȣ, ����, �������, ������
		//������ '����'+'�����̸�'+'opserve�� content'+'��¥' �������� �־��� ����.
		String title = null;
		String childBirth = child.getKidBirth();
		childBirth = childBirth.substring(0,4);
		System.out.println(childBirth+"<<childBirth");
		Calendar c = Calendar.getInstance(); //����⵵
		int year = c.get(Calendar.YEAR); //����⵵
		int age = year-(Integer.parseInt(childBirth));
		String mon = (c.get(Calendar.MONTH)+1) +"";
		if(mon.length()==1){
			mon = "0"+mon;
		}
        int day = c.get(Calendar.DAY_OF_MONTH);
        String today = (year + mon +day);
		title = age+"�� "+child.getKidName()+" "
				+sqlSessionTemplate.selectOne("com.cafe24.dmsthch.Child.ChildMapper.getOpserveContent",details.getOpserveNo())
				+" "+today;
		details.setDevelopmentTitle(title);
		details.setDevelopmentDay(today);
		sqlSessionTemplate.insert("com.cafe24.dmsthch.Child.ChildMapper.addDevelopmentDetails",details);
	}

	//���ƹߴ���(development)�� �ش����� (������ȣ)�� �ִ��� Ȯ���ϰ� ������ ������, �򰡹�ȣ�� ����Ʈ
	public String getChildDevelopmentNo(ChildDevelopment development, int teacherNo){
		String developmentNo = sqlSessionTemplate.selectOne("com.cafe24.dmsthch.Child.ChildMapper.getChildDevelopment",development.getKidFormationNo());
		if(developmentNo==null){
			System.out.println("if�� developmentNo null�϶�");
			//������, ���� �����;��Ѵ�. �̶�, �������� �ѹ��� �ƴ϶� �������� ����ȣ�� �ʿ���. ���� ����ȣ�� �����´�.
			//����ȣ�� �����ö� �ʿ��Ѱ� -->������ �ѹ�, �⵵
			Calendar c = Calendar.getInstance(); //����⵵
			int year = c.get(Calendar.YEAR); //����⵵
			Integer integerYear = year;
			String classYear = integerYear.toString(); //String��
			Map<String,Object> map = new  HashMap<String,Object>();
			map.put("classYear", year);
			map.put("teacherNo", teacherNo);
			String teacherFormationNo = sqlSessionTemplate.selectOne("com.cafe24.dmsthch.Child.ChildMapper.getTeacherFormationNo", map);
			development.setTeacherFormationNo(teacherFormationNo);
			development.setDavelopmentYear(classYear);
			sqlSessionTemplate.insert("com.cafe24.dmsthch.Child.ChildMapper.addChildDevelopment",development);
			developmentNo = sqlSessionTemplate.selectOne("com.cafe24.dmsthch.Child.ChildMapper.getChildDevelopment",development.getKidFormationNo());
		}
		return developmentNo;
	}
	
	//������ȣ �޾Ƽ� �ش� ���� 1�� ���� �޾ƿ���
	public Map<String,Object> getChildInfoForDevelopment(ChildFormation childFormation){
		return sqlSessionTemplate.selectOne("com.cafe24.dmsthch.Child.ChildMapper.getChildInfoForDevelopment",childFormation);
	}
	
	//���� �޾Ƽ� ���ɿ� �´� opserve��������
	public List<ChildDevelopmentOpserve> ChildDevelopmentAddPage(ChildClass Childclass){
		return sqlSessionTemplate.selectList("com.cafe24.dmsthch.Child.ChildMapper.getOpserve",Childclass);
	}
	
	//�ش���ġ���� ������ȣ�� �������� �������� (�ߴ��򰡸� ���� ����Ʈ)
	public List<Map<String, Object>> ChildBeforeDevelopmentAdd(int pageNo,String searchVal,String searchType,String searchAge,String licenseKindergarten){
		Calendar c = Calendar.getInstance(); //��ü ���� �� ���� �Ͻú���...����
		int year = c.get(Calendar.YEAR);
		int onePageRow = 10;
		int startRow = (pageNo-1)*onePageRow;
		Map<String,Object> map = new  HashMap<String,Object>();
		map.put("year", year);
		map.put("licenseKindergarten", licenseKindergarten);
		map.put("searchVal", searchVal);
		map.put("searchAge", searchAge);
		map.put("searchType",searchType );
		map.put("startRow",startRow);
		map.put("onePageRow",onePageRow);
		System.out.println(year+"<<year");
		System.out.println(licenseKindergarten+"<<licenseKindergarten");
		System.out.println(searchVal+"<<searchVal");
		System.out.println(searchAge+"<<searchAge");
		System.out.println(searchType+"<<searchType");
		System.out.println(startRow+"<<startRow");
		System.out.println(onePageRow+"<<onePageRow");
		
		return sqlSessionTemplate.selectList("com.cafe24.dmsthch.Child.ChildMapper.ChildBeforeDevelopmentAdd",map);
	}
	
	
	//���ƹ�ȣ�� ���� �⼮���� �������� (Ư�̻��� ����)
	public List<ChildAttendance> getCommuteAll(int kidNo){
		return sqlSessionTemplate.selectList("com.cafe24.dmsthch.Child.ChildMapper.getCommuteAll", kidNo);
	}
	
	//���� �⼮ Ư�̻��� insert
	public int unusualInsert(ChildAttendance childAttendance){
		return sqlSessionTemplate.insert("com.cafe24.dmsthch.Child.ChildMapper.unusualInsert", childAttendance);
	}
	
	//kidNo�� ���� �⼮���� ��������
	public ChildAttendance getTodayAttendance(int kidNo){
		return sqlSessionTemplate.selectOne("com.cafe24.dmsthch.Child.ChildMapper.getTodayAttendance", kidNo);
	}
	
	//���� �⼮�� ó���� �ƴ� ��� update
	public int kidAttendanceUpdate(ChildAttendance childAttendance){
		return sqlSessionTemplate.update("com.cafe24.dmsthch.Child.ChildMapper.kidAttendanceUpdate", childAttendance);
	}
	
	//���� �⼮�� ó���� ��� �⼮üũ�� insert
	public int kidAttendanceInsert(ChildAttendance childAttendance){
		return sqlSessionTemplate.insert("com.cafe24.dmsthch.Child.ChildMapper.kidAttendanceInsert", childAttendance);
	}
	
	//�⼮ Ư�̻��� ��������
	public List<Map<String, Object>> getAttendanceCategory(){
		return sqlSessionTemplate.selectList("com.cafe24.dmsthch.Child.ChildMapper.getAttendanceCategory");
	}
	
	//���� �⼮�� ������� Ȯ��
	public int isTodayCommute(String license){
		System.out.println("isTodayCommute() run ChildDao");
		return sqlSessionTemplate.selectOne("com.cafe24.dmsthch.Child.ChildMapper.isTodayCommute", license);
	}
	
	public int updateChild(Child child) {
        return sqlSessionTemplate.update("com.cafe24.dmsthch.Child.ChildMapper.updateChild", child);
    }
	
	public Child getChild(int kid_no) {
		System.out.println("getChild()");
	    return sqlSessionTemplate.selectOne("com.cafe24.dmsthch.Child.ChildMapper.getChild",kid_no);
	}
	 
	public List<Object> getClass(int currentPage, int pagePerRow) {
		Map<String,Integer> map = new  HashMap<String,Integer>();
	  	map.put("beginRow", (currentPage-1)*pagePerRow);
	   	map.put("pagePerRow", pagePerRow);
	    return sqlSessionTemplate.selectList("com.cafe24.dmsthch.Child.ChildMapper.getClass", map);
	}
	
	//���Ѱ� �˻�
	public ChildClass getClass(int classNo){
		System.out.println("getClass() run");
		return sqlSessionTemplate.selectOne("com.cafe24.dmsthch.Child.ChildMapper.getClassOne", classNo);
	}
	
	    
	public int getChildCount() {
	    return sqlSessionTemplate.selectOne("com.cafe24.dmsthch.Child.ChildMapper.getChildCount");
	    }

	public int insertChild(Child child) {
        return sqlSessionTemplate.insert("com.cafe24.dmsthch.Child.ChildMapper.insertChild", child);
    }
	public int insertClass(ChildClass childclass) {
        return sqlSessionTemplate.insert("com.cafe24.dmsthch.Child.ChildMapper.insertClass", childclass);
    }
	
	//��ü ������
	public List<Child> getChildList(String license ,int currentPage, int pagePerRow) {
	  	Map<String,Object> map = new  HashMap<String,Object>();

	  	map.put("license", license);
	  	map.put("beginRow", (currentPage-1)*pagePerRow);
	   	map.put("pagePerRow", pagePerRow);
	    return sqlSessionTemplate.selectList("com.cafe24.dmsthch.Child.ChildMapper.getChildList",map);
	}
	//���� �Ӥ�;Ʈ��
	public List<Child> getSeveralList(String license, int teacherNo, int currentPage, int pagePerRow ){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("license", license);
		map.put("teacherNo", teacherNo);
		map.put("beginRow", (currentPage-1)*pagePerRow);
	   	map.put("pagePerRow", pagePerRow);

	   	System.out.println(license);
	   	System.out.println(teacherNo);
	   	System.out.println((currentPage-1)*pagePerRow);
	   	System.out.println(pagePerRow);
	   	
	   	
        return sqlSessionTemplate.selectList("com.cafe24.dmsthch.Child.ChildMapper.severalSelect", map);
	}
	
	//�ѹ��迭 �޾Ƽ� �ݿ� �ֱ�
	public void classOrganization(String licenseKindergarten,int[] kidNo, int classNo){
		Map<String, Object> map = null;
		for(int i =0; i<kidNo.length;i++){
			map =new HashMap<String, Object>();
			map.put("licenseKindergarten", licenseKindergarten);
			map.put("kidNo", kidNo[i]);
			map.put("classNo", classNo);
			sqlSessionTemplate.insert("com.cafe24.dmsthch.Child.ChildMapper.classOrganization",map);
		}
	}

	public List<Child> getFormationChildList(ChildClass childClass){
		
		return sqlSessionTemplate.selectList("com.cafe24.dmsthch.Child.ChildMapper.getFormationChildList", childClass);
		
	}
	
	public List<Child> getRematinderFormationList(ChildClass childClass){
		return sqlSessionTemplate.selectList("com.cafe24.dmsthch.Child.ChildMapper.getRemainderFormationList",childClass);
		
	}

	public List<Child> getClassMemberList(Child child){
		return sqlSessionTemplate.selectList("com.cafe24.dmsthch.Child.ChildMapper.getClassMemberList",child);
	}
	
	public List<Child> getChildForClass(ChildClass childClass){
		return sqlSessionTemplate.selectList("com.cafe24.dmsthch.Child.ChildMapper.getChildForClass",childClass);
	}
	
	public ChildClass getClassNoToTeacherNo(int teacherNo){
		return sqlSessionTemplate.selectOne("com.cafe24.dmsthch.Child.ChildMapper.getClassNoToTeacherNo",teacherNo);
	}

}
