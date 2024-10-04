class Busca{

  String _cep = "--------";
  String _logradouro = "--------";
  String _complemento = "--------";
  String _bairro =  "--------";
  String _localidade =  "--------";

  Busca();

  Busca.fromJson(Map<String, dynamic> json)
  :
    _cep = json["cep"],
    _logradouro = json["logradouro"],
    _complemento = json["complemento"],
    _bairro = json["bairro"],
    _localidade = json["localidade"]
  ;

 String get cep => this._cep;

 set cep(String value) => this._cep = value;

  get logradouro => this._logradouro;

 set logradouro( value) => this._logradouro = value;

  get complemento => this._complemento;

 set complemento( value) => this._complemento = value;

  get bairro => this._bairro;

 set bairro( value) => this._bairro = value;

  get localidade => this._localidade;

 set localidade( value) => this._localidade = value;

}