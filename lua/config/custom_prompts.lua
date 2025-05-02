return {
    Commit = {
        prompt = "Generate a Git commit message following the Conventional Commits specification based on the provided code changes.\n\n**Format:**\n`<type>(<scope>): <description>`\n\n**Constraints:**\n- `<description>` must be under 50 characters.\n- Wrap the body at 72 characters.\n\n**Commit Types:**\n* `feat`: New feature\n* `fix`: Bug fix\n* `refactor`: Code restructuring\n* `perf`: Performance improvement\n* `style`: Formatting changes\n* `test`: Test additions/corrections\n* `docs`: Documentation updates\n* `build`: Build system changes\n* `ops`: Operational changes\n* `chore`: Miscellaneous tasks\n\n**Examples:**\n```gitcommit\nfeat(api): add user authentication endpoint\nfix(ui): correct button alignment\nrefactor(core): simplify data processing\n```",
        context = "git:staged",
        description = "Write a commit message based on staged changes",
    },
    BugHunt = {
        prompt = "Don't just fix the immediate issue. Identify the underlying root cause by: 1. Examining potential architectural problems 2. Considering edge cases that might trigger this 3. Suggesting a comprehensive solution that prevents similar issues Focus on fixing the core problem, not just the symptom. Before giving a solution, give me a reasoned analysis about why and how you're fixing the root cause. Analyze this error/bug:",
        description = "Find root of bug, (copies from CLIPBOARD)",
        context = { "register", "buffer" },
    },
    ExplainGeneration = {
        "Can you explain what you generated in detail: 1. What is the purpose of this section? 2. How does it work step-by-step? 3. What alternatives did you consider and why did you choose this one? ",
        description = { "Explain generated code" },
    },
    Review = {
        prompt = "Review the code in the file Focus on: 1. Logic flaws and edge cases 2. Performance bottlenecks 3. Security vulnerabilities 4. Maintainability concerns Suggest specific improvements with brief explanations. First, give a detailed plan. Then, implement it with the least changes and updating minimal code.",
        context = { "buffer" },
        description = "Reviews the code in buffer",
    },
    Refactor = {
        prompt = "Refactor this function to be more: Make it: - More readable (clear variable names, logical structure) - Maintainable (smaller functions with single responsibilities) - Testable (easier to write unit tests) Ensure that you do not change too much and that this part of the code remains useable without changing other parts that might depend on it. First, explain your changes and why they improve the code. ",
        context = { "visual" },
        description = "Refactors spaghetti code under selection",
    },
}
