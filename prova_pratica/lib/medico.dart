// ignore_for_file: unnecessary_this

class Medico{

String _nome = "";
int _crm = 0;
List<bool> _formacao = [];
bool _emergencia = false;
 
Medico(this._nome, this._crm, this._formacao, this._emergencia);

 String get nome => this._nome;

 set nome(String value) => this._nome = value;

 int get crm => this._crm;

 set crm(int value) => this._crm = value;

 List<bool> get formacao => this._formacao;

 set formacao(List<bool> value) => this._formacao = value;

 bool get emergencia => this._emergencia;

 set emergencia(bool value) => this._emergencia = value;

}