import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:appmovi/main.dart'; // Asegúrate de que este importe coincide con el nombre de tu archivo principal.

void main() {
  testWidgets('App bar title smoke test', (WidgetTester tester) async {
    // Construye nuestra app y dispara un fotograma.
    await tester.pumpWidget(MiApp());

    // Verifica que el título de la barra de la app sea 'Orgánicos Ya!'.
    expect(find.text('Orgánicos Ya!'), findsOneWidget);
    expect(find.text('Inicio'), findsNothing);

    // Podemos agregar más pruebas aquí, como verificar la presencia de la BottomNavigationBar.
    expect(find.byType(BottomNavigationBar), findsOneWidget);

    // También podemos verificar que los ítems de la barra de navegación sean los correctos.
    expect(find.byIcon(Icons.home), findsOneWidget);
    expect(find.byIcon(Icons.search), findsOneWidget);
    expect(find.byIcon(Icons.shopping_basket), findsOneWidget);

    // Más pruebas pueden ser añadidas para verificar el comportamiento y la UI de la aplicación.
  });
}
