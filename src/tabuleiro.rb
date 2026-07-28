class Tabuleiro
  def initialize
    @matriz = [
      [' ', ' ', ' '],
      [' ', ' ', ' '],
      [' ', ' ', ' ']
    ]
  end

  def exibir
    puts "\n      Colunas"
    puts "     1   2   3"
    puts "   +---+---+---+"
    @matriz.each_with_index do |linha, index|
      puts " #{index + 1} | #{linha[0]} | #{linha[1]} | #{linha[2]} |"
      puts "   +---+---+---+"
    end
    puts "\n"
  end

  def posicao_valida?(linha, coluna)
    linha.between?(0, 2) && coluna.between?(0, 2) && @matriz[linha][coluna] == ' '
  end

  def marcar(linha, coluna, simbolo)
    @matriz[linha][coluna] = simbolo
  end

  def verificar_vitoria(simbolo)
    (0..2).each do |i|
      return true if @matriz[i][0] == simbolo && @matriz[i][1] == simbolo && @matriz[i][2] == simbolo
      return true if @matriz[0][i] == simbolo && @matriz[1][i] == simbolo && @matriz[2][i] == simbolo
    end
    return true if @matriz[0][0] == simbolo && @matriz[1][1] == simbolo && @matriz[2][2] == simbolo
    return true if @matriz[0][2] == simbolo && @matriz[1][1] == simbolo && @matriz[2][0] == simbolo
    
    false
  end

  def cheio?(numero_jogadas)
    numero_jogadas >= 9
  end
end