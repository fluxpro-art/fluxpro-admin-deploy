import React from 'react';

const Dashboard = () => {
  return (
    <div className="p-6">
      <h1 className="text-2xl font-bold mb-4">Painel Financeiro</h1>
      <div className="grid grid-cols-2 md:grid-cols-4 gap-4">
        <div className="bg-white rounded-xl shadow p-4">Receita: R$ 12.000</div>
        <div className="bg-white rounded-xl shadow p-4">Despesas: R$ 7.500</div>
        <div className="bg-white rounded-xl shadow p-4">Lucro: R$ 4.500</div>
        <div className="bg-white rounded-xl shadow p-4">Saldo: R$ 8.200</div>
      </div>
    </div>
  );
};

export default Dashboard;