<?php
require_once "conexao.php";

$dados = json_decode(file_get_contents("php://input"), true);

if (!$dados || empty($dados['id']) || empty($dados['nome'])) {
    http_response_code(400);
    echo json_encode(["erro" => "ID e nome são obrigatórios"]);
    exit;
}

try {
    $stmt = $pdo->prepare("UPDATE clientes SET nome = ?, telefone = ?, email = ? WHERE id = ?");
    $stmt->execute([$dados['nome'], $dados['telefone'], $dados['email'], $dados['id']]);
    echo json_encode(["mensagem" => "Cliente atualizado com sucesso!"]);
} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(["erro" => $e->getMessage()]);
}
?>
