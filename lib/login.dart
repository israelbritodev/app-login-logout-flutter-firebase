import 'package:flutter/material.dart';
import 'package:flutter_application_1/auth.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool entrar = true;

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  final TextEditingController _nomeController = TextEditingController();


  final AuthService _authServ = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: (entrar)
          ? const Color.fromARGB(255, 88, 4, 4)
          : const Color.fromARGB(255, 255, 64, 64),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: (entrar)
            ? const Color.fromARGB(255, 255, 64, 64)
            : const Color.fromARGB(255, 88, 4, 4),
        title: Text(
          (entrar) ? "Minha Conta" : "Cadastrando...",
          style: TextStyle(
            color: (entrar) ? Color.fromARGB(255, 88, 4, 4) : Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Icon(
                  (entrar)
                      ? Icons.account_circle_rounded
                      : Icons.account_circle_outlined,
                  color: (entrar)
                      ? const Color.fromARGB(153, 255, 255, 255)
                      : Color.fromARGB(255, 88, 4, 4),
                  size: 110,
                ),
                const SizedBox(height: 20),
                Text(
                  (entrar)
                      ? "Seja Bem Vindo de Volta ao NetFrix+!"
                      : "Preencha com seus dados",
                  style: TextStyle(
                    color: (entrar)
                        ? Colors.white
                        : Color.fromARGB(255, 88, 4, 4),
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _emailController,
                  validator: (String? value) {
                    if (value == null) {
                      return "O campo E-mail é OBRIGATÓRIO!";
                    }
                    if (value.length < 5) {
                      return "Seu E-mail precisa ter mais de 5 caracteres";
                    }
                    if (!value.contains("@")) {
                      return "O seu e-mail precisa ter um arroba ( @ )";
                    }
                    if (!value.contains(".")) {
                      return "O seu e-mail precisa possuir o ponto ( . )";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: "E-mail",
                    fillColor: Colors.white60,
                    filled: true,
                    hintStyle: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w200,
                      fontSize: 16,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w200,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 5),
                TextFormField(
                  controller: _senhaController,
                  validator: (String? value) {
                    if (value == null) {
                      return "Você precisa possuir uma senha!";
                    }
                    if (value.length < 5) {
                      return "Sua senha precisa ter mais de 5 caracteres";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: "Senha",
                    fillColor: Colors.white60,
                    filled: true,
                    hintStyle: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w200,
                      fontSize: 16,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w200,
                    fontSize: 16,
                  ),
                  obscureText: true,
                ),
                Visibility(
                  visible: !entrar,
                  child: Column(
                    children: [
                      const SizedBox(height: 5),
                      TextFormField(
                        controller: _nomeController,
                        validator: (String? value) {
                          if (value == null) {
                            return "Você precisa possuir um nome de usuário";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "Nome de Usuário",
                          fillColor: Colors.white60,
                          filled: true,
                          hintStyle: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w200,
                            fontSize: 16,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w200,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 5),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 15),
                  child: SizedBox(
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {
                        botaoEntrar();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 88, 4, 4),
                      ),
                      child: Text(
                        (entrar) ? "Entrar" : "Cadastrar",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      entrar = !entrar;
                    });
                  },
                  child: Text(
                    (entrar) ? "Cadastrar-se" : "Entre",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  botaoEntrar() {
    String email = _emailController.text;
    String senha = _senhaController.text;
    String nome = _nomeController.text;

    if (_formKey.currentState!.validate()) {
      if(entrar){
        print("Entrada Validada");
        _authServ.loginUser(email: email, senha: senha);
      } else {
        print("Cadastro Validado");
        print(_emailController.text);
        print(_senhaController.text);
        print(_nomeController.text);
        _authServ.cadUser(email: email, senha: senha, nome: nome);
      }
      print("Formulário funcionando com sucesso!");
    } else {
      print("Ocorreu um erro inesperado");
    }
  }
}
