require_relative 'funcionario'

class Vendedor < Funcionario
  def initialize(id, nome, salario_base, comissao)
    super(id, nome, salario_base) #Chama o initialize da class Pai Funcionario
    @comissao = comissao #Vendedor recebe comissão informado no cadastro
  end

  def calcular_salario
    @salario_base + @comissao
  end
end