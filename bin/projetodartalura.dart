void main(){
  String nome = "Laranja";
  double peso = 100.2;
  String cor = "Verde e Amarela";
  String sabor = "Doce e cítrica";
  int diasDesdeColheita = 25;
  bool isMadura;

  if (diasDesdeColheita >= 30){
    isMadura = true;
  }else{
    isMadura = false;
  }

  Legumes mandioca1 = Legumes('Macaxeira', 1200, 'Marrom', true);
  Fruta banana1 = Fruta('Banana', 75, 'Amarela', 'Doce', 12);
  Nozes macadamia1 = Nozes('Macadâmia', 2, 'Branco Amarelado', 'Doce', 20, 35);
  Citricas Limao1 =Citricas('Limão', 100, 'Verde', 'Azedo', 5, 9);

  macadamia1.printAlimento();
  banana1.printAlimento();
  mandioca1.printAlimento();
  Limao1.printAlimento();

  mandioca1.cozinhar();
//Limao1.cozinhar();// não funciona
//mandioca1.fazerSuco();// não funciona
  Limao1.fazerSuco();
  banana1.separarIngredientes();
  banana1.fazerMassa();
  banana1.assar();

}

bool funcEstaMadura(int dias){
  if (dias >= 30){
    return true;
  }
  else{
    return false;
  }
}

mostarMadura(String nome, int dias, {required String cor}){
  if(dias >= 30){
    print("A $nome está madura");
  }
  else{
    print("A $nome não está madura");
  }

  if(cor != null){
    print("A $nome é $cor");
  }
}

int funcQuantosDiasMadura(int dias){
  int diasParaMadura = 30;
  int quantosDiasFaltam = diasParaMadura - dias;
  return quantosDiasFaltam;
}

class Fruta extends Alimento implements Bolo{
  String sabor;
  int diasDesdeColheita;
  bool? isMadura;
  Fruta(String nome, double peso, String cor, this.sabor, this.diasDesdeColheita,
      {this.isMadura}):super(nome,peso,cor);
  void estaMadura(int diasParaMadura){
    isMadura = diasDesdeColheita >= diasParaMadura;
    print("A sua $nome foi colhida a $diasDesdeColheita dias, e percisa de $diasParaMadura para poder comer. Ela está madura ? $isMadura");
  }
  void fazerSuco(){
    print('Você fez um ótimo suco de $nome');
  }
  @override
  void separarIngredientes(){
    print('Catar a $nome');
  }
  @override
  void fazerMassa(){
    print('Misturar a $nome junto da Farinha,do açucar e dos ovos.');
  }
  @override
  void assar(){
    print('Colocar no forno o bolo de banana.');
  }
}

class Alimento{
  String nome;
  double peso;
  String cor;
  Alimento(this.nome, this.peso, this.cor);

  void printAlimento(){
    print('Este(a) $nome pesa $peso gramas e é $cor');
  }
}

class Legumes extends Alimento implements Bolo{

  bool isPrecisaCozinhar;

  Legumes(String nome, double peso, String cor, this.isPrecisaCozinhar)
      :super(nome,peso,cor);

  void cozinhar(){
    if(isPrecisaCozinhar){
      print('Pronto, a $nome está cozinhando!');
    }else{
      print('Nem precisa cozinhar a $nome!');
    }
  }
  @override
  void assar(){
    // colocar mais tempo no forno
  }
  @override
  void fazerMassa(){
    // fazer uma papa com o legume
  }
  @override
  void separarIngredientes(){
    // Ver se o alimento está cozido ou cru
  }
}

class Citricas extends Fruta{
  double nivelAzedo;

  Citricas(String nome, double peso, String cor, String sabor, int diasDesdeColheita, this.nivelAzedo)
      : super(nome, peso, cor, sabor, diasDesdeColheita);

  void existeRefri(bool existe){
    if(existe){
      print('Existe Refrigerante de $nome');
    }else{
      print('Não existe refri de $nome');
    }
  }
}

class Nozes extends Fruta{
  double porcentagemOleoNatural;

  Nozes(String nome, double peso, String cor, String sabor, int diasDesdeColheita, this.porcentagemOleoNatural)
      : super(nome, peso, cor, sabor, diasDesdeColheita);

  @override
  void fazerMassa(){
    print('Tirar a casca da $nome');
    super.fazerMassa();
  }
}

abstract class Bolo{
  void separarIngredientes();
  void fazerMassa();
  void assar();
}
