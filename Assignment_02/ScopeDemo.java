public class ScopeDemo {
    public static void main(String[] args) {
        System.out.println("--- Scope Demonstration ---");
        
        // 1. Method Scope
        // Variable declared directly inside the method body
        int methodScopeVar = 10;
        System.out.println("Inside method: methodScopeVar = " + methodScopeVar);
        
        // 2. Loop Scope
        // Variable declared inside loop initialization
        for (int loopScopeVar = 0; loopScopeVar < 1; loopScopeVar++) {
            System.out.println("Inside loop: loopScopeVar = " + loopScopeVar);
        }
        // Try accessing loopScopeVar outside loop
        // System.out.println(loopScopeVar); // ERROR: Cannot find symbol (loopScopeVar is not accessible here)
        
        // 3. Block Scope
        // Variable declared within a specific code block
        {
            int blockScopeVar = 20;
            System.out.println("Inside block: blockScopeVar = " + blockScopeVar);
            
            // Method scope variable is accessible here because the block is within the method
            System.out.println("Accessing method variable in block: " + methodScopeVar);
        }
        // Try accessing blockScopeVar outside block
        // System.out.println(blockScopeVar); // ERROR: Cannot find symbol (blockScopeVar is not accessible here)
        
        System.out.println("\nAll valid usages executed successfully. Check the comments for out-of-scope errors.");
    }
}
