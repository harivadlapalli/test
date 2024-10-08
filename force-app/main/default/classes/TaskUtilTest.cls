@isTest
public class TaskUtilTest {
    @isTest
    static void testTaskPriority(){
       String pri = TaskUtil.getTaskPriority('CA');
        System.assertEquals('High',pri);
    }
    
     @isTest
    static void testTaskPriority1(){
       String pri = TaskUtil.getTaskPriority('NA');
        System.assertEquals('Normal',pri);
    }
    
     @isTest
    static void testTaskPriority3(){
       String pri = TaskUtil.getTaskPriority('Normal');
        System.assertEquals(null,pri);
    }
}