<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');

require_once('/Users/Prof/Documents/Auditoria/backend/config/conection.php');

$query = $pdo->query("SELECT id, nome, telefone, email FROM clients ORDER BY id");
$clientes = $query->fetchAll(PDO::FETCH_ASSOC);

echo json_encode($clientes);

?>
