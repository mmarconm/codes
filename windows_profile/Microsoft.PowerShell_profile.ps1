# Directory: C:\Users\mmarconm\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1
# Before to copy and paste this file, install chocolatey and install oh-my-posh

# oh-my-posh --init --shell pwsh --config C:\Users\mmarconm\AppData\Local\Programs\oh-my-posh\themes\darkblood.omp.json | Invoke-Expression
# oh-my-posh --init --shell pwsh --config C:\Users\mmarconm\AppData\Local\Programs\oh-my-posh\themes\honukai.omp.json | Invoke-Expression
# oh-my-posh --init --shell pwsh --config C:\Users\mmarconm\AppData\Local\Programs\oh-my-posh\themes\huvix.omp.json | Invoke-Expression
oh-my-posh --init --shell pwsh --config C:\Users\mmarconm\AppData\Local\Programs\oh-my-posh\themes\material.omp.json | Invoke-Expression
# oh-my-posh --init --shell pwsh --config C:\Users\mmarconm\AppData\Local\Programs\oh-my-posh\themes\paradox.omp.json | Invoke-Expression
# oh-my-posh --init --shell pwsh --config C:\Users\mmarconm\AppData\Local\Programs\oh-my-posh\themes\stelbent.minimal.omp.json | Invoke-Expression

function get_kubernetes_context {
    kl config get-contexts
}

function get_kubernetes_namespace {
    kl config view | select-string namespace
}

function kubewatchpod_local {
    while (1) {cls;kubectl --kubeconfig C:\Users\mmarconm\.kube\config get pods,svc,hpa,pvc,deploy; sleep 5}
}


function kubewatchpod_vmware {
    while (1) {cls;kubectl --kubeconfig C:\Users\mmarconm\.kube\minikube_config get pods,svc,hpa,pvc,deploy; sleep 5}
}

function kubewatchpod_aws {
    while (1) {cls;kubectl --kubeconfig C:\Users\mmarconm\.kube\aws_odoo get pods,svc,hpa,pvc,deploy; sleep 5}
}

function kubewatchtop {
    while (1) {cls;kl top pod; sleep 5}
}

function remove_all_docker_none {
    docker rmi $(docker images --filter "dangling=true" -q --no-trunc)
}

function stop_all_containers {
    docker stop $(docker ps -q)
}

function remove_all_stopped_containers {
    docker rm $(docker ps -qa)
}

function remove_all_images_containers {
    docker rmi $(docker images -qa)
}

Set-Alias -Name kl -Value kubectl
Set-Alias -Name gkc -Value get_kubernetes_context 
Set-Alias -Name gkn -Value get_kubernetes_namespace
Set-Alias -Name kwpvm -Value kubewatchpod_vmware
Set-Alias -Name kwpaws -Value kubewatchpod_aws
Set-Alias -Name kwp -Value kubewatchpod_local
Set-Alias -Name kwt -Value kubewatchtop

Set-Alias -Name dran -Value remove_all_docker_none
Set-Alias -Name dsac -Value stop_all_containers
Set-Alias -Name drac -Value remove_all_stopped_containers
Set-Alias -Name drai -Value remove_all_images_containers

# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}
