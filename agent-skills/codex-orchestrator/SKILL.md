---
name: codex-orchestrator
description: Coordinate tasks where Codex researches, plans, and reviews while Antigravity CLI implements changes in the same workspace.
---

Codex is the researcher, planner, and reviewer.
Antigravity CLI is the implementation worker.

Use the current project folder. Do not create worktrees.
Run only one implementation worker at a time.
Preserve existing uncommitted changes.

Workflow:
1. Read project instructions and inspect the starting Git diff.
2. Research the task and determine acceptance criteria.
3. Check whether .handoff exists in the current project directory.
   If missing, create it. If it exists as a directory, reuse it and
   preserve existing contents. If it is not a directory, report the
   blocker instead of replacing it. Then write .handoff/task.md with
   findings, allowed scope, implementation guidance, and verification
   commands.
4. Invoke Antigravity CLI from the current project directory.
   Tell it to read project instructions and the task brief,
   implement the task, run checks, and report results.
5. Capture its JSON response and conversation_id.
6. Wait for completion, then inspect the actual changes.
7. Resume that conversation for corrections when needed.
8. Verify acceptance criteria before reporting completion.

Use agy --help to confirm available command options.
Use --output-format json to capture worker results.
Use --conversation with the saved ID for follow-up work.
Respect permissions; report blockers instead of bypassing them.
If the same blocker repeats without progress, report it to the user.

Codex may edit task briefs but delegates application edits.
Workers must not invoke this orchestrator or launch more workers.
Do not commit, push, or deploy unless requested.

For React Native projects, reuse existing dependencies, Pods,
Metro, and simulators. Avoid reinstalling dependencies or cleaning
native builds unless the task requires it.
