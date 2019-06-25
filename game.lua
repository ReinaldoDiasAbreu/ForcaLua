-- Objeto com as funções principais do jogo
--

ForcaGame = {
    quant_dica = 0, dica = "", palavra = ""
}

function ForcaGame:new(forca)
    forca = forca or {}
    setmetatable(forca, self)
    self.__index = self
    return forca
end

function ForcaGame:Start()
    print("Start the Game")
    quant_dica = ForcaGame:SorteiaDica()
    dica = ForcaGame:RetornaDica(quant_dica)
    palavra, numsort = ForcaGame:SorteiaPalavra(dica)


    print("Numero de Dica: ", quant_dica)
    print("Numero Palavra: ", numsort)
    print("Dica Sorteada: ", dica)
    print("Palavra Sorteada: ", palavra)

end  

function ForcaGame:SorteiaDica() -- Raffle the dica number
    dicas = io.open("dicas.words", r)  -- Open file dicas
    q_dica = dicas:read() -- Read dica number
    dicas:close() -- Close the file
    math.randomseed(os.time()) -- Create seed for random
    return math.random(q_dica) -- Return number the raffle
end

function ForcaGame:RetornaDica(ndica) -- Return the name file dica
    dicas = io.open("dicas.words", r) -- Open file dicas
    for i=1, ndica+1, 1 do
        dica = dicas:read()  -- Read dicas
    end
    dicas:close() -- Close file
    return dica -- Return the dica name
end

function ForcaGame:SorteiaPalavra(banco_sorteado) -- Sorteia Palavra
    banco = io.open(banco_sorteado .. ".words", r)
    num_palavras = banco:read() -- Read number the words
    math.randomseed(os.time()) -- Create seed for random
    palavrasort = math.random(num_palavras) 
    
    for i=1, palavrasort, 1 do
        palavrasorteada = banco:read()
    end
    banco:close()
    return palavrasorteada, palavrasort
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

