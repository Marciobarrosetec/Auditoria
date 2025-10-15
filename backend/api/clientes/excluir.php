<?php
require_once "conexao.php";

$id = $_GET['id'] ?? null;

if (!$id) {
    http_response_code(400);
    echo json_encode(["erro" => "ID é obrigatório"]);
    exit;
}

try {
    $stmt = $pdo->prepare("DELETE FROM clientes WHERE id = ?");
    $stmt->execute([$id]);
    echo json_encode(["mensagem" => "Cliente excluído com sucesso!"]);
} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(["erro" => $e->getMessage()]);
}
?>
