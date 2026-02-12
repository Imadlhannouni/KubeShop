# Lab 33: Self Healing

## Objective
The power of GitOps is **Drift Detection**.
If someone manually deletes a deployment, ArgoCD should bring it back.

## The Task
1.  Ensure your App has `selfHeal: true` (We added it in Lab 31).
2.  **Break things**:
    `kubectl delete deploy frontend`
3.  **Watch Magic**:
    Wait 30 seconds.
    `kubectl get deploy frontend`
    It should be back!
4.  (If it doesn't come back, you didn't enable selfHeal or ArgoCD isn't syncing. You can manually `kubectl rollout restart deployment argocd-server -n argocd` to force things if needed, or click "Sync" in UI).

## Verification
Run `./check.sh`. 
(The check just verifies that the frontend exists. The mechanism is the lesson).
