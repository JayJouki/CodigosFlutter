class Tarefa{

  int _idUsuario = 0;
  int _idTarefa = 0;
  String _titulo = "";
  bool _completa = false;

    Tarefa();

  Tarefa.fromJson(Map<String, dynamic> json)
  :
    _idUsuario = json["userId"],
    _idTarefa = json["id"],
    _titulo = json["title"],
    _completa = json["completed"]
  ;

 int get idUsuario => this._idUsuario;

 set idUsuario(int value) => this._idUsuario = value;

  get idTarefa => this._idTarefa;

 set idTarefa( value) => this._idTarefa = value;

  get titulo => this._titulo;

 set titulo( value) => this._titulo = value;

  get completa => this._completa;

 set completa( value) => this._completa = value;

}