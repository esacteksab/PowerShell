$node1 = Get-HotFix -ComputerName ClusterNode1 
$node2 = Get-HotFix -ComputerName ClusterNode2 
Compare-Object -ReferenceObject $node1 -DifferenceObject $node2 -Property HotFixID
