class Agente{
  String _nome = "";
  String _classe = "";
  String foto = "";
  String frase = "";

  Agente(this._nome, this._classe, this.frase, this.foto);

  get nome => this._nome;

 set nome( value) => this._nome = value;

  get classe => this._classe;

 set classe( value) => this._classe = value;

  get getFoto => this.foto;

 set setFoto( foto) => this.foto = foto;

  get getFrase => this.frase;

 set setFrase( frase) => this.frase = frase;


}