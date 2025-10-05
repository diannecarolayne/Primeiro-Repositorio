require_relative 'funcionario'
require_relative 'gerente'
require_relative 'vendedor'
require_relative 'estagiario' 


class Main
  def initialize
    @funcionarios = []
    @id = 1 #inicia o id a partir do um
  end

  def menu
    loop do
      puts "1 - Cadastro"
      puts "2 - Listar Funcionários"
      puts "3 - Buscar"
      puts "4 - Atualizar"
      puts "5 - Remover"
      puts "6 - Sair "
      puts "Escolha uma opção acima: "
      opcao_menu = gets.chomp.to_i

      case opcao_menu
      when 1
        cadastro
      when 2 
        listar_funcionarios  
      when 3
        buscar_funcionario
      when 4
        atualizar
      when 5
        remover
      when 6
        puts "Saindo..."
        break
      else
        puts "Opção Inválida"
      end # fecha case
    end # fecha loop
  end # fecha método menu

 # ================== Cadastro ==================  
  def cadastro
    continuar = true
    
    while continuar
      puts "Digite o cargo do funcionário \n 1 - Gerente \n 2- Vendedor \n 3- Estagiario:"
      cargo = gets.chomp.to_i
      
      puts "Nome:"
      nome = gets.chomp
      
      id_seq = @id.to_s.rjust(2, '0') #to_s = String (rjust funciona em strings por isso transforma) || rjust adicionar 0 à esq se tiver apenas 1 digito || (tamanho,caractere_para_preencher )
      @id += 1 #gera dois número sequencias de acordo com a ordem cadastrada

      if cargo == 1 #Add funcionario na class gerente
        funcionario = Gerente.new(id, nome, salario_base)
      elsif cargo == 2 #Add funcionario na class vendedor e pergunta o valor da comissão
        puts "Comissão: R$"
        comissao = gets.chomp.to_f
        funcionario = Vendedor.new(id, nome, salario_base, comissao)
      elsif cargo == 3 #Add funcionario na class estagiario
        funcionario = Estagiario.new(id, nome, salario_base)
      else
        puts "Cargo inválido!"
      end
      
    @funcionarios << funcionario #add cadastro na array 

    puts "#{nome} cadastrada como #{cargo} com sucesso!"
    
    puts "Deseja cadastrar outro funcionario? (s / n):"
    acao = gets.chomp
    if acao.downcase == "n"
      continuar = false
    end
  end
end

  # ================== Listar Funcionários ==================
  def listar_funcionarios
    puts "\n=== Lista de Funcionários ==="
    if @funcionarios.empty? #Verifica se a array funcionarios está vazia
      puts "Nenhum funcionário cadastrado."
    else
      @funcionarios.each do |f| #percorre a array e mostra um por um
      puts "ID: #{f.id}, Nome: #{f.nome}, Salário Base: #{f.salario_base}, Salário Final: #{f.calcular_salario}"
      end
    end
  end
  
# ================== Buscar ==================  
def buscar_funcionario
  puts "Digite o nome do funcionário para buscar:"
  pesquisa = gets.chomp.downcase
  resultado_da_pesquisa = @funcionarios.select { |f| f.nome.downcase.include?(pesquisa) } #select percorre cada funcionar 'f' e filtra apenas o que foi pesquisado || include? verificar se o nome existe
  
  if resultado_da_pesquisa.empty?
      puts "Nenhum funcionário encontrado."
    else
      puts "Funcionários encontrados:"
      encontrados.each do |f|
        puts "ID: #{f.id}, Nome: #{f.nome}, Salário Base: #{f.salario_base}, Salário Final: #{f.calcular_salario}"
      end
    end

end
# ================== Remover ==================
def remover
    puts "Digite o ID do funcionário para remover:"
    id_busca = gets.chomp
    funcionario = @funcionarios.find { |f| f.id == id_busca } #.find percorre cada elemento um por vez, mostra o funcionario no 'f' e se a condição for verdadeira segue para o cod abaixo

    if funcionario
      @funcionarios.delete(funcionario)
      puts "Funcionário #{funcionario.nome} removido com sucesso!"
    else
      puts "ID não encontrado."
    end
  end
# ================== Rodar Sistema ==================  
menu = Main.new
menu.menu #inicia pelo menu