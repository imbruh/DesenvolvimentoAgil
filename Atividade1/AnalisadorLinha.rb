class AnalisadorLinha
    
    attr_accessor :numeroLinha, :conteudo, :palavrasFrequentes, :totalRepeticao

    def initialize(numeroLinha, conteudo)
        @numeroLinha = numeroLinha
        @conteudo = conteudo
        @palavrasFrequentes = []
        @totalRepeticao = 0
    end

    def analisaLinha()
        conteudo = @conteudo.split  
        array = []
        cont = 1     
        for palavra in conteudo           
            @totalRepeticao = conteudo.count(palavra)        
            if @totalRepeticao > cont 
                cont = @totalRepeticao
                if !@palavrasFrequentes.include?(palavra)
                    hash = Hash.new
                    hash[:palavra] = palavra
                    hash[:repetida] = cont
                    array.push(hash)                    
                    cont = 1
                    @totalRepeticao = 0  
                end         
            end           
        end
        maior = 0
        array2 = []
        array.each{|h| array2.push(h[:repetida]) 
                    maior = array2.max}
        array.each{|h| if h[:repetida] == maior && !@palavrasFrequentes.include?(h[:palavra])
                    @palavrasFrequentes.push(h[:palavra])
                    end}
               
        puts "Conteudo da linha #{@numeroLinha}: #{@conteudo}" 
        
        if @palavrasFrequentes.size > 0
            puts "Repetições:"
        end
        for j in @palavrasFrequentes          
            puts "   #{j} - #{maior}x" 
            
        end
        puts "\n"
    end
end