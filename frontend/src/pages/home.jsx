import React from "react";
import Clientes from "../Componentes/clientes";

function Home() {
  return (
    <div>
      <h1>Bem-vindo à página inicial</h1>
      <Clientes /> {/* Aqui carregamos o componente Clientes */}
    </div>
  );
}

export default Home;
