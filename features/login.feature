#language: pt

Funcionalidade: Login
	Para que eu possa ter acesso a interface de administração de spots
	Sendo um usuário que possui um bom email
	Quero poder iniciar uma nova sessão
	
    @smoke
	Cenario: Nova sessao

                Quando eu submeto a sessao com "papito@acme.com"
                Então devo ver a área de administração de spots

	Esquema do Cenario: Tentativa

                Quando eu submeto a sessao com "<email>"
                Entao devo ver a mensagem de alerta: "<mensagem>"

                Exemplos:
                | email             | mensagem                        |
                | papito&acme.com   | Oops. Informe um email válido!  |
                |                   | Oops. Informe um email válido!  |

	
