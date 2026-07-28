require_relative 'jogo_da_velha'

puts "========================================"
puts "      BEM-VINDO AO JOGO DA VELHA      "
puts "        Humano (X) vs Máquina (O)       "
puts "========================================\n\n"

partida = JogoDaVelha.new
partida.jogar

puts "\nObrigado por jogar!"