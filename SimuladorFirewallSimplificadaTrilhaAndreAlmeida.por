programa {

  inclua biblioteca Texto --> t

  funcao inicio() {
    //constantes
    const cadeia PREFIXO_BLOQUEADO = "10.0.0."
    const cadeia PREFIXO_PERMITIDO = "172.16."
    //numero_caracteres
    inteiro regra1NumeroCaracteres
    //extrair_subtexto
    cadeia regra2ValidacaoIPs
    const inteiro POSICAO_INICIAL = 0
    const inteiro POSICAO_FINAL = 7
    //entradas
    cadeia mensagemFinal
    logico permissao = falso
    caracter yn = '1'
    inteiro escolhaIP
    cadeia permissaotexto
    //LISTA DE ENDEREÇOS FIXOS
    cadeia enderecoIPs[10]
    enderecoIPs[0] = "172.16.25.10"
    enderecoIPs[1] = "10.0.0.15"
    enderecoIPs[2] = "192.168.1.88"
    enderecoIPs[3] = "172.16.0.4"
    enderecoIPs[4] = "10.0.0.230"
    enderecoIPs[5] = "192.168.0.1"
    enderecoIPs[6] = "172.16.199.3"
    enderecoIPs[7] = "8.8.8.8"
    enderecoIPs[8] = "10.0.0.99.10.10.10"
    enderecoIPs[9] = "172.16.12.1"
    //FIM DA LISTA DE ENDEREÇOS FIXOS

    //INICIO OFICIAL DA SIMULAÇÃO
    escreva("O que pretende fazer?\n-(1)Ver as regras existentes\n-(2)Ver e simular com a lista de Endereços\n-(3)Simular as permissões de todos os endereços\n-(4)Terminar Simulação\n")
    leia(yn)
    enquanto(yn != '4'){
    se(yn == '1'){
      escreva("\n--------------------\n")
      escreva("\nREGRA 1 - LIMITE DE CARACTERES EM UM ENDEREÇO IP.\n")
      escreva("\nREGRA 2 - VALIDAÇÃO DO IP, SÓ PERMITIR IPS CUJO TENHAM OS CARACTERES INICIAIS 172.16, BLOQUEAR OS QUE COMEÇAM POR 10.0.0. SEM AVISO POR SEREM MALICIOSOS E NEGAR TODOS OS OUTROS COM AVISO.\n")
      escreva("\n--------------------")
    }
    senao se(yn == '2'){
      escreva("----------LISTA DE ENDEREÇOS----------\n")
      para (inteiro i = 0; i < 10; i++)  
      {  
       escreva("Endereço ", i, " - ", enderecoIPs[i], "\n")
      }  
      escreva("--------------------------------------\n")
      escreva("Escola o Endereço que deseja utilizar: ")
      leia(escolhaIP)
      se(escolhaIP > 9 ou escolhaIP < 0){
        escreva("\nOpção Inválida")
        pare
      }
      escreva("\nO Endereço escolhido foi: ", enderecoIPs[escolhaIP])
      //REGRA 1 - LIMITE DE CARACTERES EM UM ENDEREÇO IP
      regra1NumeroCaracteres = t.numero_caracteres(enderecoIPs[escolhaIP])
      se(regra1NumeroCaracteres > 13){
        mensagemFinal = "\n\nEndereço IP Bloqueado, ultrapassa o limite de caracteres de um Endereço IP. - REGRA 1\n"
        escreva(mensagemFinal)
        pare
      }
      //FIM REGRA 1
      //REGRA 2 - VALIDAÇÃO DO IP, SÓ PERMITIR IPS CUJO TENHAM OS CARACTERES INICIAIS 172.16, BLOQUEAR TODOS OS OUTROS
      regra2ValidacaoIPs = t.extrair_subtexto(enderecoIPs[escolhaIP], POSICAO_INICIAL, POSICAO_FINAL)
      se(regra2ValidacaoIPs == PREFIXO_PERMITIDO){
        permissao = verdadeiro
        mensagemFinal = "\n\nAcesso Permitido á Firewall\n"
        escreva("\n--------------------")
        escreva(mensagemFinal)
        pare
      }
      senao se(regra2ValidacaoIPs == PREFIXO_BLOQUEADO){
        mensagemFinal = "\n\nAcesso Bloqueado - REGRA 2\n"
        escreva("\n--------------------")
        escreva(mensagemFinal)
        pare
      }
      senao{
        mensagemFinal = "\n\nAcesso Negado á Firewall\n"
        escreva("\n--------------------")
        escreva(mensagemFinal)
        pare
      }
      //FIM REGRA 2
    }
    senao se(yn == '3'){
      para (inteiro o = 0; o < 10; o++)  
      { 
        regra2ValidacaoIPs = t.extrair_subtexto(enderecoIPs[o], POSICAO_INICIAL, POSICAO_FINAL)
        se(regra2ValidacaoIPs == PREFIXO_BLOQUEADO){
          permissao = falso
          permissaotexto = "ACESSO BLOQUEADO"
          escreva("Endereço ", o, " - ", enderecoIPs[o], " -> ", permissaotexto, "\n")
        }
        senao se(regra2ValidacaoIPs == PREFIXO_PERMITIDO){
          permissao = verdadeiro
          permissaotexto = "ACESSO PERMITIDO"
          escreva("Endereço ", o, " - ", enderecoIPs[o], " -> ", permissaotexto, "\n")
        }
        senao{
          permissao = falso
          permissaotexto = "ACESSO NEGADO"
          escreva("Endereço ", o, " - ", enderecoIPs[o], " -> ", permissaotexto, "\n")
        }  
      }
      pare
    }
    senao{
      escreva("\n--------------------")
      escreva("\nOpção Inválida")
      pare
    }
    escreva("\nO que pretende fazer?\n-(1)Ver as regras existentes\n-(2)Ver e simular com a lista de Endereços\n-(3)Simular as permissões de todos os endereços\n-(4)Terminar Simulação\n")
    leia(yn)
    }
    escreva("\n--------------------")
    escreva("\nSimulação finalizada")
    escreva("\n--------------------\n")
    //FIM DA SIMULAÇÃO
  }
}