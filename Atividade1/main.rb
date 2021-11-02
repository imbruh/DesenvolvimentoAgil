require ('./AnalisadorLinha')

arquivo = File.new("texto.txt", "r")

linha = File.readlines(arquivo)

for i in 0..linha.size
    analisador = AnalisadorLinha.new(i, linha[i])
    analisador.analisaLinha()
end

