require_relative 'funcionario'

class Estagiario < Funcionario
  def initialize(id, nome, salario_base)
    super(id, nome, salario_base) #Chama o initialize da class Pai Funcionario
  end

  def calcular_salario
    @salario_base/2 #Estagiario recebe metade do salário base
  end
end