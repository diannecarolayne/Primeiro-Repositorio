require_relative 'funcionario'

class Gerente < Funcionario
  def initialize(id, nome, salario_base)
    super(id, nome, salario_base) #Chama o initialize da class Pai Funcionario
    @extra = 1000 #Gerente recebe bônus fixo sobre o salário base
  end

  def calcular_salario
    @salario_base + @extra
  end
end