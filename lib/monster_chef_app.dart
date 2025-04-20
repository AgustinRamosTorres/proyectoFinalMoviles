import 'package:flutter/material.dart';
import 'package:sesion_3_moviles/moster_chef_pagina_principal.dart';
import 'package:provider/provider.dart';
import 'lista_compra.dart';

class MonsterChefApp extends StatelessWidget {
  const MonsterChefApp({super.key});

  @override
  Widget build(BuildContext context) {
    final listaCompra = ListaCompra();
    listaCompra.init();

    return MaterialApp(
      title: "Monster Chef Application",
      //5
      home: MultiProvider(
        // 24
        providers: [ChangeNotifierProvider(create: (context) => listaCompra)],
        child: MosterChefPaginaPrincipal(titulo: "Monster Chef"),
      ),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        brightness: Brightness.light,
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
    );
  }
}
