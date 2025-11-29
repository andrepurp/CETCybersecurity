programa {
  funcao inicio() {
    cadeia nome
    inteiro idade
    real saldo = 1500, valorAdicionar
    logico maiorIdade = falso


    escreva("Insira o seu nome: ")
    leia(nome)

    escreva("Indique a sua idade: ")
    leia(idade)

    se(idade > 17)
      maiorIdade = verdadeiro

    se(maiorIdade == verdadeiro){
      escreva("Saldo Disponivel: ", saldo, "€")
      escreva("\nValor a depositar: ")
      leia(valorAdicionar)
      se(valorAdicionar > 0){
        saldo = saldo + valorAdicionar
        escreva("Saldo Disponivel: ", saldo, "€")
        }
    senao
      escreva("Não pode depositar valores negativos.\n")
    
    }
    senao
      escreva("Menor de Idade") 
  }
}
