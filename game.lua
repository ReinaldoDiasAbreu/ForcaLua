--
-- Objeto com as funções principais do jogo
--

ForcaGame = {
	letra = "", tam = 0, dica = "", palavra = {}, 
	fase=0, ERRO = {}, ACERTOS = {}, 
	WORD = {}, acertos = 0, letraspreenchidas = 0
}

function ForcaGame:new(forca)  -- Instanciação do Objeto
    forca = forca or {}
    setmetatable(forca, self)
    self.__index = self
    return forca
end

function ForcaGame:Start(mode)
	ForcaGame:Reiniciar() -- Reinicia Variaveis
	os.execute("clear")  -- Limpa tela
	str = ""
	if mode == 1 then
		io.read()
		print("-------------------------------------")
    	print("             FORCA LUA               ")
    	print("-------------------------------------")
		io.write(" Digite uma dica: ")
		ForcaGame.dica = io.read()
		io.write(" Digite uma palavra: ")
		str = io.read()
		print("\n Digite ENTER para começar...")
	else
		quant_dica = ForcaGame:SorteiaDica()  -- Sorteia Dica
    	ForcaGame.dica = ForcaGame:RetornaDica(quant_dica) -- Retorna nome da dica
		str = ForcaGame:SorteiaPalavra(ForcaGame.dica) -- Retorna a palavra sorteada
	end
	
	io.read()
	
	os.execute("clear")  -- Limpa tela
	ForcaGame.dica = string.upper( ForcaGame.dica ) -- Coloca dica em caixa alta
	ForcaGame:InicializaPalavra(str) -- Remove espacos e inicializa WORD

	while true do -- Loop do jogo

		ForcaGame:Boneco(ForcaGame.fase)  -- Imprime boneco
	
		print("Dica: ", ForcaGame.dica )
		print("Quantidade Letras: ", ForcaGame.tam)

		io.write("ERROS: ")
		ForcaGame:ImprimePalavra(ForcaGame.ERRO)
		print("")
		io.write("ACERTOS: ")
		ForcaGame:ImprimePalavra(ForcaGame.ACERTOS)
		print("\n")

		ForcaGame:PreenchePalavra()  -- Preenche a palavra com os acertos
		ForcaGame:ImprimePalavra(ForcaGame.WORD)  -- Imprime a palavra
		print("\n")

		if ForcaGame.letraspreenchidas == #ForcaGame.WORD then
			print("Voce Ganhou!!!")
			break
		elseif ForcaGame.fase < 6 then
			io.write("Digite uma Letra: ")
			ForcaGame.letra = string.upper( io.read() ) -- Coloca letra maiuscula
			ForcaGame:VerificaLetra(ForcaGame.letra) -- Verifica se a letra esta na palavra
			os.execute("clear")  -- Limpa tela
		else
			print("Voce Perdeu!!! Palavra Correta: " .. str)
			break
		end
	end

	io.close()
end  

function ForcaGame:Reiniciar() -- Reinicia variaveis do objeto
	ForcaGame.letra = ""
	ForcaGame.tam = 0
	ForcaGame.dica = ""
	ForcaGame.palavra = {}
	ForcaGame.fase= 0
	ForcaGame.ERRO = {}
	ForcaGame.ACERTOS = {}
	ForcaGame.WORD = {}
	ForcaGame.acertos = 0
	ForcaGame.letraspreenchidas = 0
end

function ForcaGame:SorteiaDica() -- Raffle the dica number
    dicas = io.open("dicas.words", r)  -- Open file dicas
    q_dica = dicas:read() -- Read dica number
    dicas:close() -- Close the file
	math.randomseed(os.time()) -- Create seed for random
	math.random()
	math.random()
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
	math.random() -- Adicionar mais Random ajudam na melhor aleatoriedade
	math.random()
	math.random()
    palavrasort = math.random(num_palavras) 
    
    for i=1, palavrasort, 1 do
        palavrasorteada = banco:read()
    end
    banco:close()
    return palavrasorteada
end

function ForcaGame:InicializaPalavra(str)
	ForcaGame.tam = #str
	for i=1, #str, 1 do
		letra = string.sub(str, i, i) -- Captura letra da palavra
		if(letra == " ") then
			letra = ForcaGame:RemoveEspaco(letra)  -- Remove espaco e contabiliza como preenchido
			ForcaGame.tam = ForcaGame.tam  - 1
		end
		letra = string.upper( letra ) -- Coloca em caixa alta
		table.insert(ForcaGame.palavra, letra) -- Insere na palavra
	end
end

function ForcaGame:RemoveEspaco(letra) -- Remove espaco e substitui por *
	caracter = ""
	if letra == " " then -- Troca espaco por hifen e contabiliza preenchido
		caracter = "*"
		ForcaGame.letraspreenchidas = ForcaGame.letraspreenchidas + 1
	else
		caracter = letra
	end
	return caracter
end

function ForcaGame:PreenchePalavra() -- Completa a palavra com os acertos
	for i=1, #ForcaGame.palavra, 1 do
		if(ForcaGame:BuscaLetra(ForcaGame.ACERTOS, ForcaGame.palavra[i]) == true)  then
			ForcaGame.WORD[i] = ForcaGame.palavra[i] -- Imprime a letra caso esteja no banco de acertos
		elseif ForcaGame.palavra[i] == "*" then
			ForcaGame.WORD[i] = "*"
		else
			ForcaGame.WORD[i] = "_" -- Nao imprime
		end
	end
end

function ForcaGame:ImprimePalavra(palavra) -- Imprime table com espaçamento
	for i=1, #palavra, 1 do
		io.write(palavra[i] .. " ")
	end
end

function ForcaGame:BuscaLetra(tab, letra)  -- Busca letra e retorna se existe e quantas ocorrencias
	cont = 0
	for i=1, #tab, 1 do
		if tab[i] == letra then
			cont = cont + 1
		end
	end
	
	if cont ~= 0 then
		return true, cont
	else
		return false, cont
	end
end

function ForcaGame:VerificaLetra(letra) -- Busca letra, verifica se é válida e contabiliza erros e acertos
	if (letra ~= "" and letra ~= " ") then
		achou, quant = ForcaGame:BuscaLetra(ForcaGame.palavra, letra)
		if achou then
			if ForcaGame:BuscaLetra(ForcaGame.ACERTOS, letra) == false then
				table.insert( ForcaGame.ACERTOS, ForcaGame.letra)
				ForcaGame.acertos = ForcaGame.acertos + 1
				ForcaGame.letraspreenchidas = ForcaGame.letraspreenchidas + quant
			end
		else
			if ForcaGame:BuscaLetra(ForcaGame.ERRO, letra) == false then
				table.insert( ForcaGame.ERRO, letra)
				ForcaGame.fase = ForcaGame.fase + 1
			end
		end
	end
end

function ForcaGame:Boneco(fase)  -- Imprime boneco corespondente com os erros
    if fase == 0 then
	
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
		
    elseif fase == 1 then
	
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
		
	elseif fase == 2 then
	
        print  ("-------------------------------------") 
		print  ("          =============              ")
		print  ("         |            ||             ")
		print  ("         |            ||             ")
		print  ("        _|_           ||             ")
		print  ("       /   \\          ||             ")
		print  ("      | 0 0 |         ||             ")
		print  ("       \\ - /          ||             ")
		print  ("      _ |_| _         ||             ")
		print  ("       |   |          ||             ")
		print  ("       |   |          ||             ")
		print  ("       |___|          ||             ")
		print  ("                      ||             ")
		print  ("                      ||             ")
		print  ("                      ||             ")
		print  ("                      ||             ")
		print  ("-------------------------------------")
		
	elseif fase == 3 then
		
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
		
	elseif fase == 4 then
        
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

    elseif fase == 5 then

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

    elseif fase == 6 then
	
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
    
return ForcaGame -- Retorna Instancia do Objeto