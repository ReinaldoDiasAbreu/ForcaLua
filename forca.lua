-- Script principal
-- com a estrutura visual do game.

Game = require("game") -- Importa arquivo game

function main()
    Forca = Game:new() -- Instancia Objeto
    continua = "S"
    while(continua == "S" or continua == "s") do
        os.execute("clear")  -- Limpa tela
        print("-------------------------------------")
        print("             FORCA LUA               ")
        print("-------------------------------------")
        print("Digite o modo do jogo: ")
        print("1 -> Multiplayer")
        print("2 -> Singleplayer")
        print("3 -> Sair")
        io.write("> ")
        mode = io.read("*number")
        
        if mode ~= 3 then
            
            Forca:Start(mode)
            print("Você deseja continuar jogando? (S/N) ")
            continua = io.read()
        else
            io.close()
            continua = "N"
        end
    end
end

main()
