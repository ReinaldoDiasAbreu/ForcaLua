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

function ForcaGame:Boneco(fase)
        if fase== 0 then
	
	    print   ("-------------------------------------") 
        print   ("          =============              ") 
        print   ("         |            ||             ") 
        print   ("         |            ||             ") 
        print   ("         |            ||             ") 
        print   ("                      ||             ") 
        print   ("                      ||             ")  
        print   ("                      ||             ")  
        print   ("                      ||             ") 
        print   ("                      ||             ") 
        print   ("                      ||             ")  
        print   ("                      ||             ")  
        print   ("                      ||             ") 
        print   ("                      ||             ")  
        print   ("                      ||             ") 
        print   ("                      ||             ")
        print   ("-------------------------------------") 
		
    elseif fase== 1 then
	
        print   ("-------------------------------------")
		print   ("          =============              ")
		print   ("         |            ||             ")
		print   ("         |            ||             ")
		print   ("        _|_           ||             ")
		print   ("       /   \\          ||            ")
		print   ("      | 0 0 |         ||             ")
		print   ("       \\ - /          ||            ")
		print   ("        |_|           ||             ")
		print   ("                      ||             ")
		print   ("                      ||             ")
		print   ("                      ||             ")
		print   ("                      ||             ")
		print   ("                      ||             ")
		print   ("                      ||             ")
		print   ("                      ||             ")
		print   ("-------------------------------------") 
		
	elseif fase== 2 then
	
        print  ("-------------------------------------") 
		print  ("          =============              ")
		print  ("         |            ||             ")
		print  ("         |            ||             ")
		print  ("        _|_           ||             ")
		print  ("      /   \\          ||             ")
		print  ("      | 0 0 |         ||             ")
		print  ("      \\ - /          ||             ")
		print  ("      _ |_| _         ||             ")
		print  ("       |   |          ||             ")
		print  ("       |   |          ||             ")
		print  ("       |___|          ||             ")
		print  ("                      ||             ")
		print  ("                      ||             ")
		print  ("                      ||             ")
		print  ("                      ||             ")
		print  ("-------------------------------------")
		
	elseif fase== 3 then
		
	    print   ("-------------------------------------")
		print   ("          =============              ")
		print   ("         |            ||             ")
		print   ("         |            ||             ")
		print   ("        _|_           ||             ")
		print   ("       /   \\          ||            ")
		print   ("      | 0 0 |         ||             ")
		print   ("       \\ - /          ||            ")
		print   ("      _ |_| _         ||             ")
		print   ("     / |   |          ||             ")
		print   ("    / /|   |          ||             ")
		print   ("   /_/ |___|          ||             ")
		print   ("                      ||             ")
		print   ("                      ||             ")
		print   ("                      ||             ")
		print   ("                      ||             ")
		print   ("-------------------------------------")
		
	elseif fase== 4 then
	
        print   ("------------------------------------- ")
		print   ("          =============               ")
		print   ("         |            ||              ")
		print   ("         |            ||              ")
		print   ("        _|_           ||              ")
		print   ("       /   \\          ||             ")
		print   ("      | 0 0 |         ||              ")
		print   ("       \\ - /          ||             ")
		print   ("      _ |_| _         ||              ")
		print   ("     / |   |          ||              ")
		print   ("    / /|   |          ||              ")
		print   ("   /_/ |___|          ||              ")
		print   ("                      ||              ")
		print   ("                      ||              ")
		print   ("                      ||              ")
		print   ("                      ||              ")
		print   ("------------------------------------- ")
		
	elseif fase== 5 then
        
        print   ("------------------------------------- ")
		print   ("          =============               ")
		print   ("         |            ||              ")
		print   ("         |            ||              ")
		print   ("        _|_           ||              ")
		print   ("       /   \\          ||             ")
		print   ("      | 0 0 |         ||              ")
		print   ("       \\ - /          ||             ")
		print   ("      _ |_| _         ||              ")
		print   ("     / |   | \\        ||             ")
		print   ("    / /|   |\\ \\       ||            ")
		print   ("   /_/ |___| \\_\\      ||            ")
		print   ("                      ||              ")
		print   ("                      ||              ")
		print   ("                      ||              ")
		print   ("                      ||              ")
		print   ("------------------------------------- ")

    elseif fase==6 then

        print   ("------------------------------------- ")
		print   ("          =============               ")
		print   ("         |            ||              ")
		print   ("         |            ||              ")
		print   ("        _|_           ||              ")
		print   ("       /   \\          ||             ")
		print   ("      | 0 0 |         ||              ")
		print   ("       \\ - /          ||             ")
		print   ("      _ |_| _         ||              ")
		print   ("     / |   | \\        ||             ")
		print   ("    / /|   |\\ \\       ||            ")
		print   ("   /_/ |___| \\_\\      ||            ")
		print   ("      /  _            ||              ")
		print   ("     /  /             ||              ")
		print   ("  __/  /              ||              ")
		print   (" |____|               ||              ")
		print   ("------------------------------------- ")

    elseif fase==7 then
	
        print   ("------------------------------------- ")
		print   ("          =============               ")
		print   ("         |            ||              ")
		print   ("         |            ||              ")
		print   ("        _|_           ||              ")
	    print   ("       /   \\          ||             ")
		print   ("      | 0 0 |         ||              ")
		print   ("       \\ - /          ||             ")
		print   ("      _ |_| _         ||              ")
		print   ("     / |   | \\        ||             ")
		print   ("    / /|   |\\ \\       ||            ")
		print   ("   /_/ |___| \\_\\      ||            ")
		print   ("      /  _  \\         ||             ")
		print   ("     /  / \\  \\        ||            ")
		print   ("  __/  /   \\  \\__     ||            ")
		print   (" |____|     |____|    ||              ")
		print   ("------------------------------------- ")
    end
 end
    
return ForcaGame

