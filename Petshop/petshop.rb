
class Petshop

    def initialize
        @db = SQLite3::Database.open '.\petshopBD.db'
        @db.execute "create table if not exists clientes (
            id_clientes integer primary key,
            usuario text not null unique, 
            senha text 
        ) " 
        @db.execute "create table if not exists agendamentos (
            id_agenda  integer primary key, 
            nome text, 
            data_nasc text not null,
            raca text, 
            serviço text,
            data_servico text,
            hora text 
        )"

        result = @db.execute "select * from clientes"
        if result.size == 0
            @db.execute "insert into clientes values(?,?,?)", nil, 'pedro', '1234'
        end
        
    end
    def inserir(login2, senha2)
        @db.execute "insert into clientes values(?,?,?)", nil, login2, senha2

    end
    
    def agendar(nome, data_nasc, raca, servico, data_servico, hora)
        @db.execute "insert into agendamentos values (?, ?, ?, ?, ?, ?, ?)", nil, nome, data_nasc, raca, servico, data_servico, hora
        puts "======CADASTRO FEITO COM SUCESSO====== "
    end

    def login(login, senha)

        @db.results_as_hash = true 

        result = @db.execute "select * from clientes"

        result.each do |a|
            if  a ['usuario'] == login  and a ['senha'] == senha

                puts "======ENTRANDO========"
                
                return true 
            end
        end
        return false
    end

    def mostrar_agenda
        agenda_result = @db.execute "select * from agendamentos "
        puts " Nome | DataNasc | Raça | Servico | Data_servico | Hora |"
        agenda_result.each do |i|
            puts "#{i['nome']} | #{i['data_nasc']} | #{i['raca']} | #{i['serviço']} | #{i['data_servico']} | #{i['hora']}"
        end

    end
    def mostrar_clientes
        mostrar = @db.execute "select nome, data_nasc from agendamentos"
        puts " Nome | DataNasc|"
        mostrar.each do |i|
            puts "#{i['nome']} | #{i['data_nasc']} |"
        end
    end






end