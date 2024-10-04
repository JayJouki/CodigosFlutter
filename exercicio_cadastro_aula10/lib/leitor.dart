// ignore_for_file: unnecessary_this

class Leitor{

  //Atributos
  String _nome = "";
  String _email = "";
  String _tipoLivro = "";
  bool _notificacao = false;
  List<String> listaInteresses = [];
  
  Leitor(this._nome, this._email, this._notificacao, this._tipoLivro, this.listaInteresses);

  List<String> get getListaInteresses => this.listaInteresses;

  set setListaInteresses(List<String> listaInteresses) => this.listaInteresses = listaInteresses;

  String get nome => this._nome;

  set nome(String value) => this._nome = value;

  get email => this._email;

  set email( value) => this._email = value;

  get tipoLivro => this._tipoLivro;

  set tipoLivro( value) => this._tipoLivro = value;

  get notificacao => this._notificacao;

  set notificacao( value) => this._notificacao = value;
}