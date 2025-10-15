<?php
require_once "conexao.php";

$dados = json_decode(file_get_contents("php://input"), true);

if (!$dados || empty($dados['nome'])) {
    http_response_code(400);
    echo json_encode(["erro" => "Nome é obrigatório"]);
    exit;
}

try {
    $stmt = $pdo->prepare("INSERT INTO clientes (nome, telefone, email) VALUES (?, ?, ?)");
    $stmt->execute([$dados['nome'], $dados['telefone'], $dados['email']]);
    echo json_encode(["mensagem" => "Cliente adicionado com sucesso!"]);
} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(["erro" => $e->getMessage()]);
}
?>
