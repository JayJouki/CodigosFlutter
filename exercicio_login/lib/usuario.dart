// ignore_for_file: prefer_final_fields, unused_field, unnecessary_this

class Usuario{

  String _nome = "";
  String _senha = "";

  Usuario(this._nome,this._senha);

  String get nome => this._nome;

  set nome(String value) => this._nome = value;

  get senha => this._senha;

  set senha( value) => this._senha = value;

}