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
    print("Dica Sorteada: ", string.upper( dica ))
    print("Palavra Sorteada: ", string.upper( palavra ))

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
    
return ForcaGame

