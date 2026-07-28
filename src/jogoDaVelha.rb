require_relative 'tabuleiro'

class JogoDaVelha
  def initialize
    @tabuleiro = Tabuleiro.new
    @numero_jogadas = 0
    sortear_quem_comeca
  end

  def sortear_quem_comeca
    @jogador_atual = ['X', 'O'].sample
    if @jogador_atual == 'X'
      puts "O jogador X começará a partida.\n"
    else
      puts "O computador O começará a partida.\n"
    end
  end

  def jogada_do_jogador
    jogada_concluida = false
    until jogada_concluida
      print "Informe a linha: "
      linha_input = gets.chomp.to_i
      print "Informe a coluna: "
      coluna_input = gets.chomp.to_i

      linha_idx = linha_input - 1
      coluna_idx = coluna_input - 1

      if !linha_input.between?(1, 3) || !coluna_input.between?(1, 3)
        puts "Posição inválida. A linha e a coluna devem estar entre 1 e 3."
      elsif !@tabuleiro.posicao_valida?(linha_idx, coluna_idx)
        puts "Posição ocupada. Escolha outra posição."
      else
        @tabuleiro.marcar(linha_idx, coluna_idx, 'X')
        jogada_concluida = true
      end
    end
  end

  def jogada_do_computador
    jogada_concluida = false
    until jogada_concluida
      linha_idx = rand(0..2)
      coluna_idx = rand(0..2)

      if @tabuleiro.posicao_valida?(linha_idx, coluna_idx)
        @tabuleiro.marcar(linha_idx, coluna_idx, 'O')
        puts "O computador jogou na posição: linha #{linha_idx + 1}, coluna #{coluna_idx + 1}."
        jogada_concluida = true
      end
    end
  end

  def jogar
    @tabuleiro.exibir
    vencedor = nil

    until vencedor || @tabuleiro.cheio?(@numero_jogadas)
      if @jogador_atual == 'X'
        jogada_do_jogador
      else
        jogada_do_computador
      end

      @numero_jogadas += 1
      @tabuleiro.exibir

      if @tabuleiro.verificar_vitoria(@jogador_atual)
        vencedor = @jogador_atual
      else
        @jogador_atual = (@jogador_atual == 'X') ? 'O' : 'X'
      end
    end

    exibir_resultado(vencedor)
  end

  def exibir_resultado(vencedor)
    if vencedor == 'X'
      puts "O jogador X venceu a partida!"
    elsif vencedor == 'O'
      puts "O computador O venceu a partida!"
    else
      puts "A partida terminou empatada."
    end
  end
end