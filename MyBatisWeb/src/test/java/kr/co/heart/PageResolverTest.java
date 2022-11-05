package kr.co.heart;

import static org.junit.Assert.assertTrue;

import org.junit.Test;

import kr.co.heart.domain.PageResolver;

public class PageResolverTest {
	
	@Test
	public void test() {
		PageResolver pr = new PageResolver(250, 1);
		pr.print();
		System.out.println("pr = " + pr);
		
		assertTrue(pr.getBeginPage() == 1);
		assertTrue(pr.getEndPage() == 10);
	}
	
	@Test
	public void test2() {
		PageResolver pr = new PageResolver(255, 19);
		pr.print();
		System.out.println("pr = " + pr);
		
		/*
		 * assertTrue(pr.getBeginPage() == 11); assertTrue(pr.getEndPage() == 20);
		 */
	}
}
