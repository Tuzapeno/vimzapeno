return {
    Commit = {
        prompt = "Generate a Git commit message following the Conventional Commits specification based on the provided code changes.\n\n**Format:**\n`<type>(<scope>): <description>`\n\n**Constraints:**\n- `<description>` must be under 50 characters.\n- Wrap the body at 72 characters.\n\n**Commit Types:**\n* `feat`: New feature\n* `fix`: Bug fix\n* `refactor`: Code restructuring\n* `perf`: Performance improvement\n* `style`: Formatting changes\n* `test`: Test additions/corrections\n* `docs`: Documentation updates\n* `build`: Build system changes\n* `ops`: Operational changes\n* `chore`: Miscellaneous tasks\n\n**Examples:**\n```gitcommit\nfeat(api): add user authentication endpoint\nfix(ui): correct button alignment\nrefactor(core): simplify data processing\n```",
        context = "git:staged",
        description = "Write a commit message based on staged changes.",
    },
}
