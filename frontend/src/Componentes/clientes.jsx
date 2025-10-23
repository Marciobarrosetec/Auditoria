import React, { useEffect, useState } from "react";
import "../App.css"; // o CSS no App.css

function Clientes() {
  const [clientes, setClientes] = useState([]);
  const [formData, setFormData] = useState({
    id: null,
    nome: "",
    telefone: "",
    email: "",
  });
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  const apiBase = "http://localhost:3000/backend/api/clientes";

  // ---------------------------
  // 🔹 READ (listar clientes)
  // ---------------------------
  function carregarClientes() {
    setLoading(true);
    fetch(`${apiBase}/listar.php`)
      .then((res) => res.json())
      .then((data) => {
        setClientes(data);
        setLoading(false);
      })
      .catch((err) => {
        setError(err.message);
        setLoading(false);
      });
  }

  useEffect(() => {
    carregarClientes();
  }, []);

  // ---------------------------
  // 🔹 CREATE / UPDATE
  // ---------------------------
  function salvarCliente(e) {
    e.preventDefault();
    const url = formData.id
      ? `${apiBase}/editar.php`
      : `${apiBase}/inserir.php`;

    fetch(url, {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify(formData),
    })
      .then((res) => res.json())
      .then(() => {
        alert(formData.id ? "Cliente atualizado!" : "Cliente adicionado!");
        setFormData({ id: null, nome: "", telefone: "", email: "" });
        carregarClientes();
      })
      .catch((err) => alert("Erro: " + err.message));
  }

  // ---------------------------
  // 🔹 DELETE
  // ---------------------------
  function excluirCliente(id) {
    if (!window.confirm("Deseja realmente excluir este cliente?")) return;
    fetch(`${apiBase}/excluir.php?id=${id}`)
      .then((res) => res.json())
      .then(() => {
        alert("Cliente excluído!");
        carregarClientes();
      })
      .catch((err) => alert(err.message));
  }

  // ---------------------------
  // 🔹 EDITAR (preenche o form)
  // ---------------------------
  function editarCliente(cliente) {
    setFormData(cliente);
  }

  if (loading) return <p>Carregando clientes...</p>;
  if (error) return <p className="erro">{error}</p>;

  return (
    <div className="clientes-container">
      <h2>Gerenciar Clientes</h2>

      {/* FORMULÁRIO */}
      <form className="clientes-form" onSubmit={salvarCliente}>
        <input
          type="text"
          placeholder="Nome"
          value={formData.nome}
          onChange={(e) => setFormData({ ...formData, nome: e.target.value })}
          required
        />
        <input
          type="text"
          placeholder="Telefone"
          value={formData.telefone}
          onChange={(e) =>
            setFormData({ ...formData, telefone: e.target.value })
          }
        />
        <input
          type="email"
          placeholder="Email"
          value={formData.email}
          onChange={(e) => setFormData({ ...formData, email: e.target.value })}
        />
        <button type="submit">
          {formData.id ? "Atualizar" : "Adicionar"}
        </button>
        {formData.id && (
          <button
            type="button"
            onClick={() =>
              setFormData({ id: null, nome: "", telefone: "", email: "" })
            }
          >
            Cancelar
          </button>
        )}
      </form>

      {/* TABELA */}
      <table className="clientes-tabela">
        <thead>
          <tr>
            <th>ID</th>
            <th>Nome</th>
            <th>Telefone</th>
            <th>Email</th>
            <th>Ações</th>
          </tr>
        </thead>
        <tbody>
          {clientes.map((cliente) => (
            <tr key={cliente.id}>
              <td>{cliente.id}</td>
              <td>{cliente.nome}</td>
              <td>{cliente.telefone || "Não informado"}</td>
              <td>{cliente.email || "Não informado"}</td>
              <td>
                <button onClick={() => editarCliente(cliente)}>✏️</button>
                <button onClick={() => excluirCliente(cliente.id)}>🗑️</button>
              </td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
}

export default Clientes;
