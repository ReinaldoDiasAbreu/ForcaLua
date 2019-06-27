-- Script principal
-- com a estrutura visual do game.

Game = require("game")

Forca = Game:new()

function main()
    print("         FORCA LUA    ")
    print("Digite o modo do jogo: ")
    print("1 -> Multiplayer")
    print("2 -> Singleplayer")
    print("3 -> Sair")
    io.write("> ")
    mode = io.read("*number")
    
    if mode ~= 3 then
        Forca:Start(mode)
    else
        io.close()
    end
end

main()
