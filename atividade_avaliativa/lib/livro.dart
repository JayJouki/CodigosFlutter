class Livro{

  String _nome = "";
  String _escritor;
  String _genero = "";
  String _descricao = "";
  
 String get nome => this._nome;

 set nome(String value) => this._nome = value;

  get escritor => this._escritor;

 set escritor( value) => this._escritor = value;

  get genero => this._genero;

 set genero( value) => this._genero = value;

  get descricao => this._descricao;

 set descricao( value) => this._descricao = value;

  Livro(this._nome, this._escritor, this._genero, this._descricao);

}