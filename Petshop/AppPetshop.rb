require 'sqlite3'
require '.\petshop'

final = false
sair = false

while  final ==  false
    puts "-----------------------Realize seu Cadastro-----------------------"
    puts "=                                                                ="
    puts "=                Já possui um cadastro? (sim \ não)               = "
    puts "=                                                                ="    
    puts "------------------------------------------------------------------"
    resposta = gets.chomp

    if resposta == 'sim'
        printf "login: "
        login = gets.chomp
        printf "senha: "
        senha = gets.chomp
        
        pet = Petshop.new
        final = pet.login(login, senha)
        
        puts "Bem vindo #{login}"
    elsif resposta == 'não'
        puts "=============CRIAR CADASTRO=============="
        puts "Digite seu usuário: "
        login2 = gets.chomp
        puts "Digite uma senha: "
        senha2 = gets.chomp

        pet = Petshop.new
        pet.inserir(login2, senha2)

        final = false
        
    end
end
while sair == false

    puts "-----------------------Opções----------------------"
    puts "01 ----- Agendamento"
    puts "02 ----- Agenda "
    puts "03 ----- Clientes Agendados"
    puts "04 ----- Sair do sistema"
    puts "-------------------------------------------------------"

    puts "Escolha uma das opções (01,02,03,04): "
    opcao = gets.chomp.to_i
    
    if opcao == 01 
        puts "===============AGENDAMENTO=================="
        puts "Digite seu nome:"
        nome = gets.chomp
        puts "Digite sua data de nascimento:"
        data_nasc = gets.chomp
        puts "Digite a raça do seu pet:"
        raca = gets.chomp
        puts "Digite o serviço que deseja (BANHO, TOSA OU BANHO & TOSA):"
        servico = gets.chomp
        puts "Data do serviço:"
        data_servico = gets.chomp
        puts "Horário:"
        horario= gets.chomp

        pet.agendar( nome, data_nasc, raca, servico, data_servico, horario)
        gets.chomp

    elsif opcao == 02
        puts "===============EXIBIR AGENDA==================="
        pet.mostrar_agenda
        gets.chomp
    elsif opcao == 03
        puts "===============EXIBIR CLIENTES==================="
        pet.mostrar_clientes
        gets.chomp
    elsif opcao == 04
        puts "==================SAINDO==================="
        
        sair = true 
    end


end




