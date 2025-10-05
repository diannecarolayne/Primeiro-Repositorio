#-------------- Funcionario --------------  
class Funcionario
  attr_accessor :id, :nome, :salario_base

  def initialize
    @id = nil
    @nome = nil
    @salario_base = 1518
  end

  def calcular_salario
    @salario_base 
  end
end