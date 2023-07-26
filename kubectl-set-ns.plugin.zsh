# Define function for "kubectl config set-context --current --namespace <namespace>"
kns() {
    kubectl config set-context --current --namespace "$1"
}
# _ksn: Custom completion function for ksn
# This function retrieves available namespaces using kubectl commands and completes them.
_kns() {
    local namespaces
    namespaces=($(kubectl get namespaces -o jsonpath='{.items[*].metadata.name}' 2>/dev/null))

    _describe 'values' namespaces
}

# Set up the completion for ksn command
compdef _kns kns
