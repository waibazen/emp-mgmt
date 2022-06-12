package com.codedecode.demo.controller;

import static org.junit.jupiter.api.Assertions.fail;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.junit.FixMethodOrder;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.junit.runners.MethodSorters;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.http.MediaType;
import org.springframework.mock.web.MockHttpServletResponse;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;

import com.codedecode.demo.entity.Employee;
import com.codedecode.demo.service.EmployeeServiceInterface;
//import com.java.test.controller.BookController;


@ExtendWith(SpringExtension.class)
@WebMvcTest(value=EmployeeController.class)//this is again integration tests
@AutoConfigureMockMvc
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
class EmployeeControllerTest {
	
	@Autowired
	private MockMvc mockMvc;
	
	@MockBean
	private EmployeeServiceInterface empServInterface;

	@Test
	void testAddEmployee() {
		fail("Not yet implemented");
	}

	@Test
	void test_01_valid_input_sucess_GetAllEmployees() throws Exception {
		Employee RECORD_1 = new Employee(1l,"ram");
		Employee RECORD_2 = new Employee(2l,"shyam");
		
		  List<Employee> records = new ArrayList<>(Arrays.asList(RECORD_1, RECORD_2));
	    
	    Mockito.when(empServInterface.getAllEmployees()).thenReturn(records);
	    MockHttpServletResponse response=mockMvc.perform(MockMvcRequestBuilders.get("/code/all"))
	    	    .andDo(print())
	    	    .andExpect(status().isOk())
	    	    .andExpect(content().contentType(MediaType.APPLICATION_JSON))
	    	    .andExpect(jsonPath("$.[0].name").value("ram"))	  
	    	    .andExpect(jsonPath("$.[0].id").value(1))	
	    	 .andReturn()
	    	    .getResponse();
	    	    
//	    	    int status=response.getStatus();
//	    	    assertEquals(200, status);
	    	    
		
	}

	@Test
	void testGetEmpById() {
		fail("Not yet implemented");
	}

	@Test
	void testDeleteEmpById() {
		fail("Not yet implemented");
	}

	@Test
	void testUpdateEmployee() {
		fail("Not yet implemented");
	}

}
