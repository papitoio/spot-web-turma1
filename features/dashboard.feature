#language:pt

Funcionalidade: Dashboard

    Cenario: Limite de spots

        Dado que o usuário "papito@ig.com.br" possui 4 spots
        Quando eu acesso o Dashboard
        Então devo ver a notificação "Você pode cadastrar até 4 spots"