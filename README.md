# Estacionamento do Seu João


## Desafio proposto

  Seu João tem um estacionamento e hoje tem um caderno onde anota todas as entradas e saídas, assim como preenche qual vaga o caminhão ocupa cada vez que acontece uma entrada ou saída.

  Agora o Sr. João quer poder fazer isso na palma de sua mão com seu Smartphone. Com seu app, ele quer ver quais vagas estão ou não ocupadas, assim como registrar entradas e saídas dos veículos e qual vaga estes veículos estão ocupando! Ele também queria ter um histórico dessas entradas e saídas para poder fazer o fechamento no final do dia.

  João é um administrador mais velho, então uma interface fácil de utilizar é mais vantajosa que uma interface muito complexa.


## Solução implementada

  Buscamos implementar uma solução simples e direta, focando no controle da vaga em si, de forma a criar uma identificação rápida e clara dos espaços disponíveis e ocupados, e utilizando de confirmações para qualquer ação que altere permanentemente o estado do sistema. Além disso, foram implementados ícones, textos e botões de tamanho maior que o padrão para facilitar a leitura de um usuário mais velho.

  Visualmente, a solução é composta de duas páginas:

#### Tela principal
<img src="https://user-images.githubusercontent.com/34992176/125110715-52f18c00-e0bb-11eb-9fc5-c09021de0060.png" alt="Tela Principal" width="300"/>

  Nessa tela encontramos o estacionamento, representado por meio de caixas retangulares destinadas a simular uma vaga real de estacionamento que, ao serem clicadas, disponibilizam dois tipos de interação ao usuário:
  
  * A opção de inserir um veículo na vaga ativa:
  <img src="https://user-images.githubusercontent.com/34992176/125111039-c5626c00-e0bb-11eb-8535-5db99d97f9d4.png" alt="Dialog confirmação de entrada" width="300"/>
    Permite ao usuário colocar o veículo na vaga selecionada. Para facilidade de uso, o horário registrado na vaga é, por padrão, o horário em que o clique foi realizado, permitindo-se ao usuário configurar esse horário caso necessário.
      
   * A opção de remover um veículo na vaga ativa:

<img src="https://user-images.githubusercontent.com/34992176/125111365-31dd6b00-e0bc-11eb-9543-9559f3a693ef.png" alt="Dialog confirmação de saída" width="300"/><img src="https://user-images.githubusercontent.com/34992176/125111498-5f2a1900-e0bc-11eb-94e7-f0d999f1c1d1.png" alt="Dialog tempo total" width="300"/>
  
  Caso já haja algum veículo registrado na vaga, surge a opção do usuário remover aquele veículo. Assim que a remoção é efetuada, o horário de saída é registrado automaticamente e uma nova caixa de diálogo exibe o tempo total de ocupação da vaga por aquele veículo, para fins de cobrança, caso necessário.
    
#### Tela de histórico
        
<img src="https://user-images.githubusercontent.com/34992176/125111707-9bf61000-e0bc-11eb-8d8a-dad579e737a5.png" alt="Tela de histórico" width="300"/>

  Para a tela de histórico buscamos representar de forma direta todos os dados relevantes para aquele registro, isto é, o horário de entrada, para todos os registros, e os horários de saída e tempo total para os registros concluídos. 
  As opções de interação do usuário se dão por meio dos botões circulares na parte superior da tela, que permitem a filtragem por tipo de veículo:
  
<img src="https://user-images.githubusercontent.com/34992176/125111736-a2848780-e0bc-11eb-8ad4-0d20a67f2b50.png" alt="Tela de histórico" ativos width="300"/>  <img src="https://user-images.githubusercontent.com/34992176/125111751-a6b0a500-e0bc-11eb-97a0-58389d4e0dcf.png" alt="Tela de histórico inativos" width="300"/>

## Execução
  Para executar o aplicativo, basta realizar a clonagem do código fonte e, com o Flutter instalado em seu computador, utilizar os comandos:
  
  ```
    flutter pub get
    flutter run
  ```
   Ou utiize a IDE de sua preferência :)
   
   
## Detalhes técnicos
  Para essa solução foram utilizados:
  * MobX para gerência de estados
  * Modular para estruturação e injeção de dependências
  * Mockito para mock em testes unitários
  * Sqflite para armazenamento local e persistência dos dados relevantes

## Autor
  Essa implementação, design, testes e textos foram feitos por Marco A. Fernandes e estão disponíveis para usos de qualquer fim.
  A imagem 'carro.svg' foi obtida sob licença de domnínio público.
  

