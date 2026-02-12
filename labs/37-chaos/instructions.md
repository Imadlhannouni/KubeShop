# Lab 37: The Final Exam (Chaos)

## Objective
**Production is War.**
Things break. Pods die. Nodes crash.
Can you fix it?

## The Task
1.  Run the **Chaos Script**: `./chaos.sh` (I will create this for you).
2.  It will:
    -   Delete your catalog service.
    -   Scale your frontend to 0.
    -   Corrupt your configmap.
3.  **YOUR JOB**:
    -   Use `setup-tools` (kubectl, helm, argocd).
    -   Bring everything back to green.
    -   If you set up **GitOps** correctly, a simple `Application Sync` might trigger a fix for some things!
    -   But the configmap corruption might need a manual revert or git revert.

## Verification
Run `./check.sh`. It checks if *everything* is healthy again.
