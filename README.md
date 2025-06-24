# 💸 Payflow — Next Level Week #6

Aplicativo desenvolvido durante a **Next Level Week #6 - Trilha Flutter**, promovido pela [Rocketseat](https://rocketseat.com.br). O **Payflow** tem como objetivo ajudar usuários a **organizar seus boletos**, permitindo o cadastro, listagem e remoção de contas a pagar.

## ✨ Funcionalidades

- Leitura de boletos via QR Code ou código de barras  
- Cadastro manual de boletos (nome, vencimento, valor)  
- Listagem de boletos pendentes e pagos  
- Exclusão de boletos  
- Autenticação com Google  

## 🚀 Tecnologias utilizadas

- [Flutter](https://flutter.dev/)
- [Dart](https://dart.dev/)
- [Firebase Auth](https://firebase.google.com/products/auth)
- [Google Fonts](https://pub.dev/packages/google_fonts)
- [Flutter Barcode Scanner](https://pub.dev/packages/flutter_barcode_scanner)

## 🧠 Conceitos aplicados

- Clean Architecture  
- Gerenciamento de estado com `Provider`  
- Firebase Authentication  
- Componentização de UI com widgets reutilizáveis  
- Leitura de código de barras com pacote externo  

## 🛠️ Como rodar o projeto

1. Clone o repositório:

```bash
git clone https://github.com/dev-gabriel-henrique/payflow-nlw.git
cd payflow-nlw
```

2. Instale as dependências:

```bash
flutter pub get
```

3. Configure o firebase
- Crie um projeto no Firebase Console

- Ative o login com Google

- Adicione os arquivos google-services.json (Android) e/ou GoogleService-Info.plist (iOS)

4. Execute o app:

```bash
flutter run
```