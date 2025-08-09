// essa classe representa os estados da aplicação relacionados às mensagens
// ela é usada para gerenciar o estado da aplicação de forma eficiente
// e por ser abstrata, não pode ser instanciada diretamente
// as classes que herdam dela devem implementar os métodos necessários
abstract class MessagesStates {}

//idle - classe que representa o estado inicial, não faz nada
class IddleMessage extends MessagesStates {}

class SuccessMessage extends MessagesStates {
  final String message;

  SuccessMessage(this.message);
}

class ErrorMessage extends MessagesStates {
  final String message;

  ErrorMessage(this.message);
}
