-- Objeto com as funções principais do jogo
--

ForcaGame = {}

function ForcaGame:new(forca)
    forca = forca or {}
    setmetatable(forca, self)
    self.__index = self
    return forca
end

function ForcaGame:Start()
    print("Start the Game")
end  
    
return ForcaGame

